//
//  ProfileContributionLoader.swift
//  Slide for Reddit
//
//  Created by Carlos Crane on 1/4/17.
//  Copyright © 2017 Haptic Apps. All rights reserved.
//

import Foundation
import reddift
import XLPagerTabStrip
import RealmSwift

class ProfileContributionLoader: ContributionLoader {
    var name: String
    var userContent: UserContent
    var color: UIColor
    var canGetMore = true

    init(name: String, whereContent: UserContent){
        self.name = name
        color = ColorUtil.getColorForUser(name: name)
        paginator = Paginator()
        content = []
        userContent = whereContent
        indicatorInfo = IndicatorInfo(title: userContent.title)
    }
    
    
    var paginator: Paginator
    var content: [Object]
    var delegate: ContentListingViewController?
    var indicatorInfo: IndicatorInfo
    var paging = true
    
    func getData(reload: Bool) {
        if(delegate != nil){
            do {
                if(reload){
                    paginator = Paginator()
                }
                try delegate?.session?.getUserContent(name, content: userContent, sort: .hot, timeFilterWithin: (delegate?.time)!, paginator: paginator, completion: { (result) in
                    switch result {
                    case .failure:
                        self.delegate?.failed(error: result.error!)
                    case .success(let listing):

                        if(reload){
                            self.content = []
                        }
                        var baseContent = listing.children.flatMap({$0})
                        for item in baseContent {
                            if(item is Comment){
                                self.content.append(RealmDataWrapper.commentToRComment(comment: item as! Comment, depth: 0))
                            } else {
                                self.content.append(RealmDataWrapper.linkToRSubmission(submission: item as! Link))
                            }
                        }
                        self.paginator = listing.paginator
                        DispatchQueue.main.async{
                            self.delegate?.doneLoading()
                        }
                    }
                })
            } catch {
                print(error)
            }

        }
    }
}
