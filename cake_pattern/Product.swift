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

protocol ProductsRepositoryInjectable {
  var products: ProductsRepository { get }
}

extension ProductsRepositoryInjectable {
  var products: ProductsRepository {
    return ProductsRepositoryImplementation ()
  }
}


// Now using the injectable

struct ProductViewModel: ProductsRepositoryInjectable {

  init() {
    self.products.fetchProducts().forEach {
      print ("This \($0.name) costs R\($0.price)")
    }
  }
}

ProductViewModel()
