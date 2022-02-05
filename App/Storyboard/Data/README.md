# Data

- Data Layer contains Repository Implementations and one or many Data Sources. 
- Repositories are responsible for coordinating data from different Data Sources. 
- Data Source can be Remote or Local (for example persistent database). 
- Data Layer depends only on the Domain Layer. In this layer, we can also add mapping of Network JSON Data (e.g. Decodable conformance) to Domain Models.
