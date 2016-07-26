//
//  FilterPreferences.swift
//  Yelp
//
//  Created by Martene Mendy on 7/25/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import Foundation

class FilterPreferences: NSObject {

   let deals = true
   let sortBy: YelpSortMode = .BestMatched
   let distance = "Auto"
   let categories = [String]()
   
}