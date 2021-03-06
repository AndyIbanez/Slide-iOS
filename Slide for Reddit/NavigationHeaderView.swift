//
//  UZTextViewCell.swift
//  Slide for Reddit
//
//  Created by Carlos Crane on 1/6/17.
//  Copyright © 2016 Haptic Apps. All rights reserved.
//

import UIKit
import reddift

class NavigationHeaderView: UIView {
    var logo: UIImageView = UIImageView()
    var accounts: UIButton = UIButton()
    var multis: UIButton = UIButton()
    var profile: UIButton = UIButton()
    var you: UIButton = UIButton()
    var inbox: UIButton = UIButton()
    var settings: UIButton = UIButton()
    var search: UISearchBar = UISearchBar()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.search = UISearchBar(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: 50))
        
        self.accounts = UIButton(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: 50))
        self.multis = UIButton(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: 50))
        self.profile = UIButton(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: 50))
        self.settings = UIButton(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: 50))
        self.you = UIButton(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: 50))
        self.inbox = UIButton(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: 50))

        backgroundColor = ColorUtil.foregroundColor
        
        self.logo = UIImageView(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
        self.logo.image = UIImage.init(named: "slogo")?.addImagePadding(x: 20, y: 20)
        self.logo.contentMode = .scaleAspectFit
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        accounts.translatesAutoresizingMaskIntoConstraints = false
        multis.translatesAutoresizingMaskIntoConstraints = false
        profile.translatesAutoresizingMaskIntoConstraints = false
        settings.translatesAutoresizingMaskIntoConstraints = false
        search.translatesAutoresizingMaskIntoConstraints = false
        you.translatesAutoresizingMaskIntoConstraints = false
        inbox.translatesAutoresizingMaskIntoConstraints = false
        
        accounts.setTitle("Manage accounts", for: .normal)
        accounts.setImage(UIImage(named: "add")?.withColor(tintColor: ColorUtil.fontColor).imageResize(sizeChange: CGSize.init(width: 30, height: 30)), for: .normal)
        accounts.contentHorizontalAlignment = .left
        accounts.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        accounts.tintColor = ColorUtil.fontColor
        accounts.setTitleColor(ColorUtil.fontColor, for: .normal)
        
        multis.setTitle("Multireddits", for: .normal)
        multis.setImage(UIImage(named: "multis")?.withColor(tintColor: ColorUtil.fontColor).imageResize(sizeChange: CGSize.init(width: 30, height: 30)), for: .normal)
        multis.contentHorizontalAlignment = .left
        multis.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        multis.tintColor = ColorUtil.fontColor
        multis.setTitleColor(ColorUtil.fontColor, for: .normal)
        
        you.setTitle("You", for: .normal)
        you.setImage(UIImage(named: "profile")?.withColor(tintColor: ColorUtil.fontColor).imageResize(sizeChange: CGSize.init(width: 30, height: 30)), for: .normal)
        you.contentHorizontalAlignment = .left
        you.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        you.tintColor = ColorUtil.fontColor
        you.setTitleColor(ColorUtil.fontColor, for: .normal)

        inbox.setTitle("Inbox", for: .normal)
        inbox.setImage(UIImage(named: "messages")?.withColor(tintColor: ColorUtil.fontColor).imageResize(sizeChange: CGSize.init(width: 30, height: 30)), for: .normal)
        inbox.contentHorizontalAlignment = .left
        inbox.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        inbox.tintColor = ColorUtil.fontColor
        inbox.setTitleColor(ColorUtil.fontColor, for: .normal)

        profile.setTitle("Go to profile", for: .normal)
        profile.setImage(UIImage(named: "profile")?.withColor(tintColor: ColorUtil.fontColor).imageResize(sizeChange: CGSize.init(width: 30, height: 30)), for: .normal)
        profile.contentHorizontalAlignment = .left
        profile.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        profile.tintColor = ColorUtil.fontColor
        profile.setTitleColor(ColorUtil.fontColor, for: .normal)

        settings.setTitle("Settings", for: .normal)
        settings.setImage(UIImage(named: "settings")?.withColor(tintColor: ColorUtil.fontColor).imageResize(sizeChange: CGSize.init(width: 30, height: 30)), for: .normal)
        settings.contentHorizontalAlignment = .left
        settings.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        settings.tintColor = ColorUtil.fontColor
        settings.setTitleColor(ColorUtil.fontColor, for: .normal)

        let aTap = UITapGestureRecognizer(target: self, action: #selector(self.switchAccounts(_:)))
        accounts.addGestureRecognizer(aTap)
        accounts.isUserInteractionEnabled = true
        
        let pTap = UITapGestureRecognizer(target: self, action: #selector(self.showProfileDialog(_:)))
        profile.addGestureRecognizer(pTap)
        profile.isUserInteractionEnabled = true
        
        let sTap = UITapGestureRecognizer(target: self, action: #selector(self.settings(_:)))
        settings.addGestureRecognizer(sTap)
        settings.isUserInteractionEnabled = true

        let yTap = UITapGestureRecognizer(target: self, action: #selector(self.you(_:)))
        you.addGestureRecognizer(yTap)
        you.isUserInteractionEnabled = true

        let iTap = UITapGestureRecognizer(target: self, action: #selector(self.inbox(_:)))
        inbox.addGestureRecognizer(iTap)
        inbox.isUserInteractionEnabled = true

        addSubview(logo)
        addSubview(accounts)
        addSubview(multis)
        addSubview(profile)
        addSubview(settings)
        addSubview(search)
        addSubview(you)
        addSubview(inbox)

        self.clipsToBounds = true
        updateConstraints()
        
    }
    
    func you(_ sender: AnyObject){
        let profile = ProfileViewController.init(name: AccountController.currentName)
        self.parentController?.show(profile, sender: self.parentController)
    }
    
    func inbox(_ sender: AnyObject){
        let inbox = InboxViewController.init()
        self.parentController?.show(inbox, sender: self.parentController)
    }
    
    func showProfileDialog(_ sender: AnyObject){
        let alert = UIAlertController(title: "Enter a username", message: "", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        alert.addAction(UIAlertAction(title: "Go to user", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            let profile = ProfileViewController.init(name: (textField?.text!)!)
            self.parentController?.show(profile, sender: self.parentController)
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        parentController?.present(alert, animated: true, completion: nil)
    }
    
    func settings(_ sender: AnyObject){
        self.parentController?.show(SettingsViewController.init(), sender: self.parentController!)
    }
    func switchAccounts(_ sender: AnyObject){
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        
        for s in AccountController.names {
            let add = UIAlertAction(title: s, style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                AccountController.switchAccount(name: s)
                if !UserDefaults.standard.bool(forKey: "done" + s){
                    do{
                        try (self.parentController as! NavigationSidebarViewController).parentController?.addAccount(token: OAuth2TokenRepository.token(of: s))
                    } catch {
                        (self.parentController as! NavigationSidebarViewController).parentController?.addAccount()
                    }
                } else {
                    Subscriptions.sync(name: s, completion:{
                        (self.parentController as! NavigationSidebarViewController).parentController?.restartVC()
                    })
                }
            })
            optionMenu.addAction(add)
            
        }
        
        if(AccountController.isLoggedIn){
            let guest = UIAlertAction(title: "Guest", style: .default, handler: {
                (alert: UIAlertAction!) -> Void in
                AccountController.switchAccount(name: "GUEST")
                Subscriptions.sync(name: "GUEST", completion: { 
                    (self.parentController as! NavigationSidebarViewController).parentController?.restartVC()
                })
            })
            optionMenu.addAction(guest)
            
            let deleteAction = UIAlertAction(title: "Log out", style: .destructive, handler: {
                (alert: UIAlertAction!) -> Void in
                AccountController.delete(name: AccountController.currentName)
            })
            optionMenu.addAction(deleteAction)
            
        }
        
        let add = UIAlertAction(title: "Add account", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            (self.parentController as! NavigationSidebarViewController).parentController?.addAccount()
        })
        optionMenu.addAction(add)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })
        optionMenu.addAction(cancelAction)
        
        parentController?.present(optionMenu, animated: true, completion: nil)
    }
    
    var parentController: UIViewController?
    func setSubreddit(subreddit: String, parent: UIViewController){
        self.subreddit = subreddit
        self.parentController = parent
        logo.backgroundColor = ColorUtil.getColorForSub(sub: subreddit)
        updateConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var subreddit = ""
    
    override func updateConstraints() {
        super.updateConstraints()
        
        let metrics=["topMargin": 0]
        let views=["accounts": accounts, "logo":logo, "multis": multis, "search":search, "inbox": inbox, "profile":profile, "you": you, "settings":settings] as [String : Any]
        
        var constraint:[NSLayoutConstraint] = []
        
        
        constraint.append(contentsOf:NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[logo]-(0)-|",
                                                                    options: NSLayoutFormatOptions(rawValue: 0),
                                                                    metrics: metrics,
                                                                    views: views))
        constraint.append(contentsOf:NSLayoutConstraint.constraints(withVisualFormat: "H:|-(12)-[accounts]-(12)-|",
                                                                    options: NSLayoutFormatOptions(rawValue: 0),
                                                                    metrics: metrics,
                                                                    views: views))
        constraint.append(contentsOf:NSLayoutConstraint.constraints(withVisualFormat: "H:|-(12)-[you]-(12)-|",
                                                                    options: NSLayoutFormatOptions(rawValue: 0),
                                                                    metrics: metrics,
                                                                    views: views))

        constraint.append(contentsOf:NSLayoutConstraint.constraints(withVisualFormat: "H:|-(12)-[multis]-(12)-|",
                                                                    options: NSLayoutFormatOptions(rawValue: 0),
                                                                    metrics: metrics,
                                                                    views: views))
        constraint.append(contentsOf:NSLayoutConstraint.constraints(withVisualFormat: "H:|-(12)-[profile]-(12)-|",
                                                                    options: NSLayoutFormatOptions(rawValue: 0),
                                                                    metrics: metrics,
                                                                    views: views))
        constraint.append(contentsOf:NSLayoutConstraint.constraints(withVisualFormat: "H:|-(12)-[inbox]-(12)-|",
                                                                    options: NSLayoutFormatOptions(rawValue: 0),
                                                                    metrics: metrics,
                                                                    views: views))

        constraint.append(contentsOf:NSLayoutConstraint.constraints(withVisualFormat: "H:|-(12)-[settings]-(12)-|",
                                                                    options: NSLayoutFormatOptions(rawValue: 0),
                                                                    metrics: metrics,
                                                                    views: views))
        constraint.append(contentsOf:NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[search]-0-|",
                                                                    options: NSLayoutFormatOptions(rawValue: 0),
                                                                    metrics: metrics,
                                                                    views: views))
        
        if(AccountController.isLoggedIn){
            you.isHidden = false
            inbox.isHidden = false
            constraint.append(contentsOf:NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[logo(150)]-0-[you(60)]-0-[inbox(60)]-0-[accounts(60)]-0-[profile(60)]-0-[settings(60)]-0-[multis(60)]-4-[search]-0-|",
                                                                        options: NSLayoutFormatOptions(rawValue: 0),
                                                                        metrics: metrics,
                                                                        views: views))

        } else {
        constraint.append(contentsOf:NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[logo(150)]-0-[accounts(60)]-0-[profile(60)]-0-[settings(60)]-0-[multis(60)]-4-[search]-0-|",
                                                                    options: NSLayoutFormatOptions(rawValue: 0),
                                                                    metrics: metrics,
                                                                    views: views))
            you.isHidden = true
            inbox.isHidden = true
        }
        
        
        addConstraints(constraint)
    }
    
    func getEstHeight()-> CGFloat{
        return CGFloat(60 * (AccountController.isLoggedIn ? 7 : 5)) + 150
    }
}
