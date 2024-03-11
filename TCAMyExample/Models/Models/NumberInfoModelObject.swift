//
//  NumberInfoModelObject.swift
//  TCAMyExample
//
//  Created by Андрей Барсуков on 07.03.2024.
//

import Foundation
import SDAO
import RealmSwift

// MARK: - NumberInfoModelObject

public final class NumberInfoModelObject: RealmModel {
    
    // MARK: - Properties
    
    /// ID of the number information.
    @objc dynamic public var id = ""

    /// The numerical representation of the number.
    @objc dynamic public var number = 0

    /// A descriptive title providing information about the number.
    @objc dynamic public var title = ""
}
