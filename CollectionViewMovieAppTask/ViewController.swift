

import UIKit

// source: https://www.advancedswift.com/resize-uiimage-no-stretching-swift/
extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}


class Movie {
    var name: String
    var genre: String
    var rating: Double
    var image: UIImage
    var IsFavorite: Bool
    
    init(name: String, genre: String, rating: Double, image: UIImage, IsFavorite: Bool) {
        self.name = name
        self.genre = genre
        self.rating = rating
        self.image = image
        self.IsFavorite = IsFavorite
    }
}

class MovieCell: UICollectionViewCell {
    
    private let moviewStackView = UIStackView()
    private var movie: Movie?
    private var imageView = UIImageView()
    private let nameLabel = UILabel()
    private let ganreLabel = UILabel()
    private var isFavoriteButton = UIButton()
    private let ratingLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        
        contentView.addSubview(ganreLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(isFavoriteButton)
        contentView.addSubview(moviewStackView)
        contentView.addSubview(isFavoriteButton)
        contentView.addSubview(ratingLabel)

        
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        ganreLabel.textColor = UIColor(red: 0.39, green: 0.45, blue: 0.58, alpha: 1)
        ganreLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        isFavoriteButton.setImage(UIImage(named: "greyHeart"), for: .normal)
        isFavoriteButton.addAction(UIAction(handler: { [weak self] action in
            if let isFavorite = self?.movie?.IsFavorite {
                if isFavorite == true {
                    self?.movie?.IsFavorite = false
                    self?.isFavoriteButton.setImage(UIImage(named: "greyHeart"), for: .normal)
                } else {
                    self?.movie?.IsFavorite = true
                    self?.isFavoriteButton.setImage(UIImage(named: "heart"), for: .normal)
                }
            }
            
        }), for: .touchUpInside)
        
        ratingLabel.backgroundColor = UIColor(red: 1, green: 0.5, blue: 0.21, alpha: 1)
        ratingLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        ratingLabel.textColor = .white
        ratingLabel.layer.masksToBounds = true
        ratingLabel.layer.cornerRadius = 4
        
    
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        ganreLabel.translatesAutoresizingMaskIntoConstraints = false
        isFavoriteButton.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            ratingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            ratingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            isFavoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            isFavoriteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            ganreLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            ganreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ganreLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(movie: Movie) {
        self.movie = movie
        
        imageView.image = movie.image.scalePreservingAspectRatio(targetSize: CGSize(width: 164, height: 230))
//        imageView.image = movie.image
        nameLabel.text = movie.name
        ganreLabel.text = movie.genre
        ratingLabel.text = "\(movie.rating)"
        
    }
    
}

class ViewController: UIViewController {

    private let maincStackView = UIStackView()
    let movies: [Movie] = [
        Movie(name: "The Batman", genre: "Action", rating: 8.1, image: UIImage(named: "batman")!, IsFavorite: false),
        Movie(name: "Uncharted", genre: "Advanture", rating: 7.9, image: UIImage(named: "film1")!, IsFavorite: false),
        Movie(name: "The Exorcism of God", genre: "Horor", rating: 5.6, image: UIImage(named: "film2")!, IsFavorite: false),
        Movie(name: "Turning Red", genre: "Comedy", rating: 7.1, image: UIImage(named: "film3")!, IsFavorite: false),
        Movie(name: "Spider-Man: No Way Home", genre: "Action", rating: 8.1, image: UIImage(named: "film4")!, IsFavorite: false),
        Movie(name: "Morbius", genre: "Action", rating: 5.3, image: UIImage(named: "film5")!, IsFavorite: false),
    ]
    private let maincLabel = UILabel()
    private let topBar = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.1, green: 0.13, blue: 0.2, alpha: 1)
        
        setupTopbar()
        setupMainStackView()
        setupConstraints()
    }
    
    func setupTopbar() {
        let logo = UIImageView()
        logo.image = UIImage(named: "Product Logo")
        logo.frame = CGRect(x: 0, y: 0, width: 33, height: 37)
        
        let profileButton = ButtonWithPadding()
        profileButton.setPadding(top: 8, left: 16, bottom: 8, right: 16)
        profileButton.setTitle("Profile", for: .normal)
        profileButton.backgroundColor = UIColor(red: 1, green: 0.5, blue: 0.21, alpha: 1)
        profileButton.layer.cornerRadius = 8
        
        topBar.addArrangedSubview(logo)
        topBar.addArrangedSubview(profileButton)
        topBar.alignment = .center
        topBar.axis = .horizontal
        topBar.distribution = .equalSpacing
        
        view.addSubview(topBar)
    }
    
    func setupMainStackView() {
        maincStackView.backgroundColor = UIColor(red: 0.1, green: 0.13, blue: 0.2, alpha: 1)
        
        maincStackView.axis = .vertical
//        maincStackView.distribution = .fill
//        maincStackView.alignment = .top
        maincStackView.spacing = 15
        
        maincLabel.text = "Now in cinemas"
        maincLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        maincLabel.textColor = .white
        
        maincStackView.addArrangedSubview(maincLabel)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
//        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        collectionView.backgroundColor = UIColor(red: 0.1, green: 0.13, blue: 0.2, alpha: 1)
        
        maincStackView.addArrangedSubview(collectionView)
        
        view.addSubview(maincStackView)
    }
    
    func setupConstraints() {
        maincStackView.translatesAutoresizingMaskIntoConstraints = false
        topBar.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            topBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            topBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topBar.heightAnchor.constraint(equalToConstant: 64),
            
            maincStackView.topAnchor.constraint(equalTo: topBar.bottomAnchor),
            maincStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            maincStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            maincStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as? MovieCell
        
        cell?.configure(movie: movies[indexPath.row])
        
        return cell ?? UICollectionViewCell()
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 164, height: 300)
    }
    

}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newItem = MovieInformationViewController()
        self.navigationController?.pushViewController(newItem, animated: true)
        
    }
}
