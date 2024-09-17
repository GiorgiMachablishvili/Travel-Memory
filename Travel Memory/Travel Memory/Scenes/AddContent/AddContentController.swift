//
//  AddContentController.swift
//  Travel Memory
//
//  Created by Gio's Mac on 17.09.24.
//

import UIKit

class AddContentController: UIViewController {
    
    //MARK: -UI components
    private lazy var topColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 14)
        view.textColor = .black
        view.textAlignment = .center
        view.text = "Add Content to Your Journal"
        return view
    }()
    
    private lazy var sloganLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.KoronaOneRegular(size: 12)
        view.textColor = .black
        view.textAlignment = .center
        view.numberOfLines = 2
        view.text = "You can start adding memories and content to your journal, Let’s begin!"
        return view
    }()
    
    
    
    private lazy var bottomColorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .background
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    


}
