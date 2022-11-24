//
//  StreamViewController.swift
//  StreamingTVChannels
//
//  Created by Anna Buzhinskaya on 24.11.2022.
//

import UIKit

class StreamViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkDataFetch.shared.fetchChannels(api: "https://limehd.online/playlist/channels.json") { result in
            print("Result: \(result)")
        }
    }

}
