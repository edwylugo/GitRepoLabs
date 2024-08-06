//
//  ItemPullRequestTableViewCellSpec.swift
//  GitRepoLabsTests
//
//  Created by Edwy Lugo on 06/08/24.
//

import Quick
import Nimble
@testable import GitRepoLabs
import SDWebImage

class ItemPullRequestTableViewCellSpec: QuickSpec {
    override class func spec() {
        var cell: ItemPullRequestTableViewCell!
        var tableView: UITableView!
        var pullRequest: PullRequestModel!
        
        beforeEach {
            tableView = UITableView()
            tableView.register(UINib(nibName: "ItemPullRequestTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemPullRequestTableViewCell")
            
            cell = tableView.dequeueReusableCell(withIdentifier: "ItemPullRequestTableViewCell") as? ItemPullRequestTableViewCell

            pullRequest = pullRequest
        }
        
        describe("ItemPullRequestTableViewCell") {
            context("when configured with a pull request") {
                beforeEach {
                    cell.configure(content: ItemPullRequestTableViewCell.Configuration(cardPullRequestView: CardPullRequestView.Configuration(titleAndBodyView: TitleAndBodyView.Configuration(textTitle: String(), textBody: String()), profileUserPullRequestView: ProfileUserPullRequestView.Configuration(userNameText: String(), nameText: String(), avatarURL: URL(string: String())))))
                }
            }
        }
    }
}
