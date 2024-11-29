import Foundation

// MARK: - SearchResponseModel
struct SearchResponseModel: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title : String
    let description: String
    let category: String
    let price : Double
    let discountPercentage : Double
    let rating: Double
    let stock: Int
    let tags: [String]
    let brand : String?
    let sku: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation : String
    let shippingInformation: String
    let availabilityStatus: String
    let reviews: [Review]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
}


// MARK: - Dimensions
struct Dimensions: Codable {
    let width : Double
    let height: Double
    let depth: Double
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt: String
    let barcode: String
    let qrCode: String
}


// MARK: - Review
struct Review: Codable {
    let rating: Int
    let comment: String
    let date: String
    let reviewerName : String
    let reviewerEmail: String
}
