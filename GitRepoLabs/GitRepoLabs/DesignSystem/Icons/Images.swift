//
//  Images.swift
//  GitRepoLabs
//
//  Created by Edwy Lugo on 04/08/24.
//

import UIKit

struct Images {
    struct Icons {
        static let ic_stars = UIImage(named: "ic_stars")?.withRenderingMode(.alwaysTemplate) ?? UIImage()
        static let ic_forks = UIImage(named: "ic_forks")?.withRenderingMode(.alwaysTemplate) ?? UIImage()
        static let ic_profile = UIImage(named: "ic_profile")?.withRenderingMode(.alwaysOriginal) ?? UIImage()
        static let ic_voltar = UIImage(named: "ic_voltar")?.withRenderingMode(.alwaysTemplate) ?? UIImage()
    }
}
