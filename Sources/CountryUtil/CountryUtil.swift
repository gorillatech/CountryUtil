//
//  CountryUtil.swift
//  CountryUtil
//
//  Created by Gui on 09/05/22.
//

import Foundation
import StoreKit

public struct CountryUtil {
    
    private static let data: [Country] = {

        guard let url = Bundle.module.url(forResource: "country_codes", withExtension: "json") else {
            fatalError("Failed to locate country_codes.json in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load country_codes.json from bundle.")
        }
        
        guard let countryCode = try? JSONDecoder().decode([Country].self, from: data) else {
            fatalError("Failed to deserialize country_codes.json")
        }
        return countryCode
    }()
    
    public static func find(alpha3: String?) -> Country? {
        return CountryUtil.data.first(where: {$0.alpha3 == alpha3})
    }
    
}

@available(iOS 13.0, *)
public extension SKStorefront {
    var country: Country? {
        return CountryUtil.find(alpha3: self.countryCode)
    }
}

// This file was generated from JSON Schema using quicktype https://app.quicktype.io, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let countryCode = try? newJSONDecoder().decode(CountryCode.self, from: jsonData)


// MARK: - CountryCodeElement
public struct Country: Codable {
    let name: String
    public let alpha2: String
    let alpha3: String
    let countryCode: String
    let iso31662: String
    let region: Region
    let subRegion: String
    let intermediateRegion: IntermediateRegion
    let regionCode: String
    let subRegionCode: String
    let intermediateRegionCode: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case alpha2 = "alpha-2"
        case alpha3 = "alpha-3"
        case countryCode = "country-code"
        case iso31662 = "iso_3166-2"
        case region = "region"
        case subRegion = "sub-region"
        case intermediateRegion = "intermediate-region"
        case regionCode = "region-code"
        case subRegionCode = "sub-region-code"
        case intermediateRegionCode = "intermediate-region-code"
    }
}

public enum IntermediateRegion: String, Codable {
    case caribbean = "Caribbean"
    case centralAmerica = "Central America"
    case channelIslands = "Channel Islands"
    case easternAfrica = "Eastern Africa"
    case empty = ""
    case middleAfrica = "Middle Africa"
    case southAmerica = "South America"
    case southernAfrica = "Southern Africa"
    case westernAfrica = "Western Africa"
}

public enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case asia = "Asia"
    case empty = ""
    case europe = "Europe"
    case oceania = "Oceania"
}
