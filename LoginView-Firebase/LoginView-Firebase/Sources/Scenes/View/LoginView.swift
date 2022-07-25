//
//  LoginView.swift
//  LoginView-Firebase
//
//  Created by Daniil Yarkovenko on 24.07.2022.
//

import UIKit

class LoginView: UIView {

    private lazy var BackgroundImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "images-2")
        imageView.applyBlurEffect()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 25
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0.0
        label.font = .systemFont(ofSize: 60, weight: .light)
        label.text = "Welcome"
        label.textColor = .systemBackground
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var DiscriptionLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0.0
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.text = "This is my school project on firebase."
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .systemBackground
        return label
    }()

    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var emailTextfield: UITextField = {
        let textfield = UITextField()
        let whitePlaceholderText = NSAttributedString(string: "Email Address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemBackground])
        textfield.alpha = 0.0
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.white.cgColor
        textfield.textAlignment = .center
        textfield.textColor = .systemBackground
        textfield.layer.cornerRadius = 25
        textfield.layer.masksToBounds = true
        textfield.attributedPlaceholder = whitePlaceholderText
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    private lazy var passwordTextfield: UITextField = {
        let textfield = UITextField()
        let whitePlaceholderText = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemBackground])
        textfield.alpha = 0.0
        textfield.layer.borderWidth = 1
        textfield.layer.borderColor = UIColor.white.cgColor
        textfield.textAlignment = .center
        textfield.textColor = .systemBackground
        textfield.isSecureTextEntry = true
        textfield.layer.cornerRadius = 25
        textfield.layer.masksToBounds = true
        textfield.attributedPlaceholder = whitePlaceholderText
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(loginButtonTap(sender: )), for: .touchUpInside)
        button.alpha = 0.0
        button.backgroundColor = .systemGreen
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.tintColor = .systemBackground
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()

    init() {
        super.init(frame: .zero)
            commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        setupView()
        setupHieracly()
        setupLayout()
        
        UIView.animate(withDuration: 0.7, animations: {
            self.headerLabel.alpha = 1.0
        })

        UIView.animate(withDuration: 0.7, delay: 0.3, animations: {
            self.DiscriptionLabel.alpha = 1.0
        })

        UIView.animate(withDuration: 0.7, delay: 0.6, animations: {
            self.emailTextfield.alpha = 1.0
        })

        UIView.animate(withDuration: 0.7, delay: 0.9, animations: {
            self.passwordTextfield.alpha = 1.0
        })

        UIView.animate(withDuration: 0.7, delay: 1.2, animations: {
            self.loginButton.alpha = 1.0
        })

    }

    @objc private func loginButtonTap(sender: UIButton) {
        animateButtonTap(viewToAnimate: sender)
    }

    private func animateButtonTap(viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        } completion: { (_) in
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: .curveEaseIn) {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            } completion: { _ in }
        }
    }



    private func setupView() {
        addSubview(BackgroundImageView)
        addSubview(stackView)
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(DiscriptionLabel)
        stackView.addArrangedSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(emailTextfield)
        buttonsStackView.addArrangedSubview(passwordTextfield)
        buttonsStackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(horizontalStackView)
//        horizontalStackView.addArrangedSubview(<#T##view: UIView##UIView#>)
    }

    private func setupHieracly() {

    }

    private func setupLayout() {
        BackgroundImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        BackgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        BackgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        BackgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.75).isActive = true

        headerLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true

        emailTextfield.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        emailTextfield.heightAnchor.constraint(equalToConstant: 50).isActive = true

        passwordTextfield.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        passwordTextfield.heightAnchor.constraint(equalToConstant: 50).isActive = true

        loginButton.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
