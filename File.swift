import Foundation
import UIKit

protocol Functionality {
    func foo()
    var value: Int { get set }
}

class FunctionalityImpl {
    
    // MARK: - Initializers
    
    init() {
        self.a = 5
    }
    
    init(a: Int) {
        self.a = a
    }
    
    // MARK: - Functionality
    
    func foo() {
    }
    
    var value: Int
    
    // MARK: - Dependencies
    
    private let a: Int
    
    // MARK: - Privates
    
    private enum Constants {
        static let key = ""
    }
    
    private func helperCalculation() {
    }
    
}

/////////////////////////
import SnapKit

class FunctionalityView: UIView {
    
    // MARK: - Initializers
    
    init() {
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - FunctionalityView
    
    var title: String? {
        get { label.text }
        set { label.text = newValue }
    }
    
    // MARK: - Privates
    
    private enum Constant {
        static let key = ""
    }
    
    private lazy var label = UILabel {
        let label = UILabel()
        label.tintColor = .red
        return label
    }()
    
    private func addSubviews() {
        addSubview(label)
    }
    
    private func setupLayout() {
        label.snp.make {
            $0.center.equalToSuperview()
        }
    }

}
/////////////////////////////////////
class FunctionalityViewModel {}

class TableViewDelegate {}

class FuncionalityViewController: UIViewController {
    
    // MARK: - Initializers
    
    init(viewModel: FunctionalityViewModel) {
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - FuncionalityViewController
    
    var dismiss: (() -> Void)?
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        view = FunctionalityView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //
    }
    
    // MARK: - Dependencies
    
    private let viewModel: FunctionalityViewModel
    private let tableViewDelegate = TableViewDelegate()
    
    // MARK: - Privates
    
    private var functionalityView: FunctionalityView! {
        view as? FunctionalityView
    }
    
    private func configureSubviews() {
        functionalityView.title = "test"
        // functionalityView.tableView.delegate = tableViewDelegate
    }

}
