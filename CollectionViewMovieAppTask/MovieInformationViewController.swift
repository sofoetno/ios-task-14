

import UIKit

class MovieInformationViewController: UIViewController {
    
    private let movieStackView = UIStackView()
    private let movieImage = UIImageView()
    private let ratingLabel = UILabel()
    private let imdbLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let detailsStack = UIStackView()
    private let selecTButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.1, green: 0.13, blue: 0.2, alpha: 1)
        
        
        setupNavigationBar()
        
        setupMovieImage()
        setupRatingLabel()
        setupImdbLabel()
        setupDescriptionLabel()
        setupDetails()
        setupSelectButton()
        
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        imdbLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        selecTButton.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
        
    }
    
    func setupNavigationBar() {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "Back"), for: .normal)
        
        let button = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = button
        title = "The Batman"
        
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)
        ]
        
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "Back")
    }
    
    func setupMovieImage() {
        movieImage.image = UIImage(named: "batmanBoy")
        movieImage.contentMode = .scaleAspectFit
        view.addSubview(movieImage)
    }
    
    func setupRatingLabel() {
        ratingLabel.text = "8.3"
        ratingLabel.textColor = .white
        ratingLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.addSubview(ratingLabel)
    }
    
    func setupImdbLabel() {
        imdbLabel.text = "IMDB"
        imdbLabel.textColor = UIColor(red: 0.39, green: 0.45, blue: 0.58, alpha: 1)
        imdbLabel.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(imdbLabel)
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.text = "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement."
        descriptionLabel.textColor = .white
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(descriptionLabel)
    }
    
    func setupDetails() {
        let details = [
            ("Certificate", "16+"),
            ("Runtime", "02:56"),
            ("Release", "2022"),
            ("Genre", "Action, Crime, Drama"),
            ("Director", "Matt Reeves"),
            ("Cast", "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro, Andy Serkis, Peter Sarsgaard"),
        ]
        
        detailsStack.axis = .vertical
        detailsStack.spacing = 12
        detailsStack.translatesAutoresizingMaskIntoConstraints = false
        
        for detail in details {
            let label = UILabel()
            label.text = detail.0
            label.textColor = UIColor(red: 0.389, green: 0.452, blue: 0.58, alpha: 1)
            label.font = UIFont.systemFont(ofSize: 14)
                        
            let value = UILabel()
            value.text = detail.1
            value.textColor = .white
            value.font = UIFont.systemFont(ofSize: 14)
            value.lineBreakMode = .byWordWrapping
            value.numberOfLines = 0
            
            let rowStack = UIStackView(arrangedSubviews: [label, value])
            rowStack.spacing = 16
            rowStack.alignment = .top
            
            detailsStack.addArrangedSubview(rowStack)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            label.widthAnchor.constraint(equalToConstant: 90).isActive = true
        }
        
        view.addSubview(detailsStack)
        
    }
    
    func setupSelectButton() {
        selecTButton.backgroundColor = UIColor(red: 1, green: 0.5, blue: 0.21, alpha: 1)
        selecTButton.setTitle("Select session", for: .normal)
        selecTButton.setTitleColor(UIColor.white, for: .normal)
        selecTButton.layer.masksToBounds = true
        selecTButton.layer.cornerRadius = 8
        view.addSubview(selecTButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieImage.heightAnchor.constraint(equalToConstant: 210),
            
            ratingLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 12),
            ratingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            imdbLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 4),
            imdbLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            descriptionLabel.topAnchor.constraint(equalTo: imdbLabel.bottomAnchor, constant: 28),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            detailsStack.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            detailsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            detailsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            selecTButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            selecTButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            selecTButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            selecTButton.heightAnchor.constraint(equalToConstant: 52)
            
            
        ])
    }
}
