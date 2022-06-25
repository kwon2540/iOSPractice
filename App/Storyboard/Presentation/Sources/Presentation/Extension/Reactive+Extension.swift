//
//  Reactive+Extension.swift
//  
//
//  Created by Maharjan Binish on 2022/03/30.
//

import RxSwift
import RxCocoa
import WebKit

protocol OptionalType {
    associatedtype Wrapped
    func flatMap<U>(_ transform: (Wrapped) throws -> U?) rethrows -> U? // Optional で定義されているメソッドを書いているだけ
}

extension Optional: OptionalType {}

extension ObservableType {

    /// flatMap でクロージャーを処理後、nil 以外ならアンラップして流す
    func skipNil<R>(_ transform: @escaping (Element) -> R) -> Observable<R.Wrapped> where R: OptionalType {
        flatMap { element -> Observable<R.Wrapped> in
            transform(element).flatMap(Observable.just) ?? Observable.empty()
        }
    }
}

extension ObservableType where Element: OptionalType {

    /// Optional の中身が nil 以外ならアンラップして流す
    func skipNil() -> Observable<Element.Wrapped> {
        skipNil { $0 }
    }

    /// Optional の中身が nil 以外ならアンラップして流す。nil なら引数で指定した値を流す
    func unwrapOr(_ alternativeValue: Element.Wrapped) -> Observable<Element.Wrapped> {
        flatMap { element -> Observable<Element.Wrapped> in
            let value = element.flatMap({ $0 }) ?? alternativeValue
            return Observable<Element.Wrapped>.just(value)
        }
    }
}

extension Reactive where Base == WKWebView {
    
    var loadUrl: Binder<URL> {
        Binder(base) { observer, url in
            let urlRequest = URLRequest(url: url)
            observer.load(urlRequest)
        }
    }
}
