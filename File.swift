//  Created by Tomasz Mędryk on 25/03/15.
//  Copyright (c) 2015 smartpatient. All rights reserved.

import Foundation
import UIKit

// sourcery: AutoMockable
protocol Functionality  {
    func foo()
    var value: Int { get set }
}

// Use Impl suffix in the class name only when there is a dedicated protocol defining the interface
class FunctionalityImpl {
    
    // Place Constant enum at the top of the file
    private enum Constants {
        static let key = ""
    }
    
    // MARK: - Dependencies
    
    private let someDependency: SomeDependency
    
    // MARK: - Initializers
    
    init(someDependency: SomeDependency) {
        self.someDependency = someDependency
    }
    
    // MARK: - Functionality
    
    // Keep the same order as in the protocol definition
    func foo() {
    }
    
    var value: Int
    
    // MARK: - Privates
    
    // Place helper methods on the bottom of the file
    private func helperCalculation() {
    }
    
}

/////////////////////////

class FunctionalitySpec: QuickSpec {
    // swiftlint:disable:next function_body_length
    override func spec() {
        describe("Functionality") {
            var sut: Functionality!
            var someDependencyMock: SomeDependencyMock!
            
            beforeEach {
                someDependency = SomeDependencyMock()
                sut = FunctionalityImpl(someDependency: someDependency)
            }
            
            context("when ...") {
                beforeEach {
                    sut.foo()
                }
                
                it("should ...") {
                    expect(sut.value) == 999
                }
                
                it("should ...") {
                    expect(someDependency...) == 999
                }
            }
        }
    }
}

/////////////////////////

//  Created by Tomasz Mędryk on 25/03/15.
//  Copyright (c) 2015 smartpatient. All rights reserved.

// Use SnapKit for defining constraints
import SnapKit 

// Add to SomeView all subviews and configure static parameters here
class SomeView: UIView { 
    
    // Place Constant enum at the top of the file
    private enum Constant { 
        static let key = ""
    }
    
    // MARK: - Initializers
    
    init() {
        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - FunctionalityView
    
    // Use getters and setters for subview properties access 
    // Do not expose the while subview to the interface until absolutely necessary
    var title: String? { 
        get { label.text }
        set { label.text = newValue }
    }
    
    // MARK: - Privates
    
    // Initialize and define the subview in one place
    private lazy var label = UILabel {
        let label = UILabel()
        label.tintColor = .red
        return label
    }()
    
    // Dedicated configuration method for adding subviews
    private func addSubviews() {
        addSubview(label)
    }
    
    // Dedicated configuration method for defining constraints
    private func setupLayout() {
        label.snp.make {
            $0.center.equalToSuperview()
        }
    }

}
/////////////////////////////////////
//  Created by Tomasz Mędryk on 25/03/15.
//  Copyright (c) 2015 smartpatient. All rights reserved.

class SomeViewModel {}

class TableViewDelegate {}

class SomeViewController: UIViewController {
    
    // MARK: - Dependencies
    
    // Define the class dependencies above init
    private let viewModel: FunctionalityViewModel
    private let tableViewDelegate = TableViewDelegate()
    
    // MARK: - Initializers
    
    init(viewModel: SomeViewModel, tableViewDelegate: TableViewDelegate) {
        self.viewModel = viewModel
        self.tableViewDelegate = tableViewDelegate
    }
    
    required init?(coder: NSCoder) { nil }
    
    // MARK: - SomeViewController
    
    var dismiss: (() -> Void)?
    
    // MARK: - View Lifecycle
    
    override func loadView() {
        view = SomeView()
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
    
    // MARK: - Privates
    
    // Place helper methods on the bottom of the file
    private var contentView: SomeView! {
        view as? SomeView
    }
    
    private func configureSubviews() {
        contentView.title = "test"
        // contentView.tableView.delegate = tableViewDelegate
    }

}
