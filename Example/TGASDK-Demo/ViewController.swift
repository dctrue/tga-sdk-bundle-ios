//
//  ViewController
//  Created on 2022/9/10
//  Description <#文件描述#>
//  PD <#产品文档地址#>
//  Design <#设计文档地址#>
//  Copyright © 2022 TGASDK. All rights reserved.
//  @author 刘小彬(liuxiaomike@gmail.com)
//

import UIKit
import TGASDK

/// row 类型
private enum Row: Int, CaseIterable {
    case config
    case initTGA
    case openGameCenter
    
    public var name: String {
        switch self {
        case .config:
            return "配置";
        case .initTGA:
            return "初始化SDK"
        case .openGameCenter:
            return "打开游戏中心"
        }
    }
}



/// MARK - ViewController
final class ViewController: UIViewController {

    /// 列表
    private lazy var tableView: UITableView = {
        $0.rowHeight = 50
        $0.dataSource = self
        $0.delegate = self
        $0.separatorInset = .zero
        $0.tableFooterView = UIView()
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Demo"
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


/// MARK - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Row.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = Row.allCases[indexPath.row].name
        return cell
    }
}

/// MARK - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch Row.allCases[indexPath.row] {
        case .config:
            TGASdk.shared.configuration.webTheme = "orange"
            TGASdk.shared.configuration.lang = "\(Locale(identifier: NSLocale.preferredLanguages.first ?? "zh-Hans").languageCode ?? "")"
            TGASdk.shared.configuration.navigationBarTintColor = UIColor.red
            TGASdk.shared.configuration.navigationTintColor = UIColor.white
            TGASdk.shared.configuration.navigationTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            TGASdk.shared.configuration.statusBarStyle = .lightContent
            TGASdk.shared.configuration.navigationBackImage = UIImage(named: "navigation_back_default")
        case .initTGA:
            TGASdk.shared.initSdk(env: nil, appKey: "", authCode: nil, delegate: self)
        case .openGameCenter:
            TGASdk.shared.openGameCenter(secUrl: "")
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

/// MARK - TGASDKDelegate
extension ViewController: TGASdkDelegate {
    
    func tgaSdkInitSucceed() {
        debugPrint("初始化成功")
    }
    
    func tgaSdkInitError(_ error: NSError) {
        debugPrint("初始化失败\(error.localizedDescription)")
    }
    
    func tgaSdkOnLogout() {
        debugPrint("用户登出")
    }
    
    func tgaSdkCloseGameCenter() {
        debugPrint("关闭游戏中心")
    }
    
    func tgaSdkGetAuthCode(completion: ((String?) -> Void)) {
        debugPrint("获取授权AuthCode")
    }
}
