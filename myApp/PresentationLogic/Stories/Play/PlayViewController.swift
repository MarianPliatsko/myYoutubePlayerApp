//
//  PlayViewController.swift
//  myApp
//
//  Created by mac on 2022-08-11.
//

import UIKit
import youtube_ios_player_helper

class PlayViewController: UIViewController {
    
    // MARK: - Properties
    
    var video: Video?
    var homeCollectionCell = HomeCollectionViewCell()
    
    private var likesValue: Int = 0 {
        didSet {
            likeLabel.text = "\(likesValue)"
        }
    }
    private var unlikesValue: Int = 0 {
        didSet {
            unlikeLabel.text = "\(unlikesValue)"
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet private var authorImageViewTop: UIImageView!
    @IBOutlet private var authorNameLabelTop: UILabel!
    @IBOutlet private var videoView: YTPlayerView!
    @IBOutlet private var videoNameLabel: UILabel!
    @IBOutlet private var countOfViewsLabel: UILabel!
    @IBOutlet private var countOfCommentsLabel: UILabel!
    @IBOutlet private var likeLabel: UILabel!
    @IBOutlet private var unlikeLabel: UILabel!
    @IBOutlet private var likeButton: UIButton!
    @IBOutlet private var unlikeButton: UIButton!
    @IBOutlet var addToFavoriteButton: UIButton! // REVIEW: make private
    @IBOutlet weak var videoDescription: UITextView!
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        changeSizeOfAuthorImage()
        
        likesValue = 0
        unlikesValue = 0
        
        countOfViewsLabel.text = "1000 views"
        countOfCommentsLabel.text = "500 comments"
        //        checkFavoriteStatus()
    }
    
    // MARK: - Actions
    
    @IBAction func likeButtonClick(_ sender: Any) {
        if likeButton.tag == 0 {
            likeButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            likeButton.tag = 1
            likesValue -= 1
        } else {
            likeButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
            likeButton.tag = 0
            likesValue += 1
        }
    }
    
    @IBAction func unlikeButtonClick(_ sender: Any) {
        if unlikeButton.tag == 0 {
            unlikeButton.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
            unlikeButton.tag = 1
            unlikesValue += 1
        } else {
            unlikeButton.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
            unlikeButton.tag = 0
            unlikesValue -= 1
        }
    }
    
    @IBAction func addToFavoriteClick(_ sender: Any) {
        updateFavoriteButton()
    }
    
    //MARK: - PlayViewController functions
    
    func changeSizeOfAuthorImage() {
        authorImageViewTop.layer.cornerRadius = authorImageViewTop.frame.height/2
    }
    
    func setupView () {
        guard let video = video else {
            return
        }
        videoNameLabel.text = video.title
        videoView.load(withVideoId: video.videoId)
        videoDescription.text = video.description
    }


    func updateFavoriteButton() {
        let favoritesData = FavoritesData.videoData.fetchFavorites()
        guard let video = video else {return}
        if favoritesData.contains(where: { $0.videoId == video.videoId }){
            addToFavoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
            FavoritesData.videoData.removeFromFavorites(video: video)
        } else {
            addToFavoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            FavoritesData.videoData.addToFavorites(video: video)
        }
    }
}
//    func checkFavoriteStatus() {
//        let favoritesData = VideoDataRepository.videoData.fetchFavorites()
//        guard let model = model else {return}
//        if favoritesData.contains(model) {
//            addToFavoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
//        } else {
//            addToFavoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
//        }
//    }

