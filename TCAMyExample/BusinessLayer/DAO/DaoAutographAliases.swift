//
//  DaoAutographAliases.swift
//  TCAMyExample
//
//  Created by Andrey Barsukov on 07.03.2024.
//

import SDAO
import Monreau

// MARK: - Aliases

/// DAO alias for  ProjectPlainObject entity
typealias NumberInfoDAO = DAO<RealmStorage<NumberInfoModelObject>, NumberInfoTranslator>
