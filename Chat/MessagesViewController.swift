//
//  MessagesViewController
//  Chat
//
//  Created by Derek Hollis on 5/28/17.
//  Copyright © 2017 Derek Hollis. All rights reserved.
//

import UIKit
import Firebase

class MessagesViewController: UI
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        checkIfUserIsLoggedIn()
        
        setupInputComponents()
    }
    
    func checkIfUserIsLoggedIn()
    {
        if Auth.auth().currentUser == nil
        {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
            handleLogout()
        }
    }
    
    func handleLogout()
    {
        let firebaseAuth = Auth.auth()
        
        do
        {
            try firebaseAuth.signOut()
        }
        catch let signOutError as NSError
        {
            print ("Error signing out: %@", signOutError)
        }
        
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: nil)
    }
    
    func setupInputComponents()
    {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.red
        containerView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(containerView)
        
        containerView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        containerView.
    }
}
