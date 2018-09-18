import foundation

struct Product {
  var name: String
  var price: Double
}

protocol ProductsRepository {
  func fetchProducts () -> [Product]
}

struct ProductsRepositoryImplementation: ProductsRepository {
  func fetchProducts () -> [Product] {
    return [Product(name: "Adidas Sneakers", price: 2030.0), Product (name: "Nike Sneakers", price: 100.0)]
    }
}

protocol ProductsRespositoryInjectable {
  var products: ProductsRepository { get }
}

extension ProductsRepositoryInjectable {
  var products: ProductRepository {
    return ProductsRepositoryImplementation ()
  }
}
