//
//  PlayerViewController.swift
//  MySong
//
//  Created by Amina TomasMart on 07.03.2024.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    var position: Int = 0
    var songs: [Song] = []
    var player: AVAudioPlayer?
    var screen = UIScreen.main.bounds
    
    lazy var holder: UIView = {
        return $0
    }(UIView(frame: view.frame))
    
    
    lazy var indicator: UIActivityIndicatorView = {
        $0.center.x = albumImageView.center.x
        $0.center.y = albumImageView.center.y
        $0.bounds.size = CGSize(width: 50, height: 50)
        $0.style = .large
        $0.hidesWhenStopped = true
        $0.isHidden = true
        return $0
    }(UIActivityIndicatorView())
    
    lazy var progressLabel: UILabel = {
        $0.center.x = albumImageView.center.x
        $0.center.y = albumImageView.center.y+50
        $0.bounds.size = CGSize(width: screen.width-40, height: 40)
        $0.textAlignment = .center
        $0.text = "0%"
        $0.textColor = .red
        $0.font = UIFont.systemFont(ofSize: 30, weight: .black)
        $0.numberOfLines = 0
        $0.isHidden = false
        return $0
    }(UILabel())
    
    lazy var progressView: UIProgressView = {
        $0.backgroundColor = .red
        $0.isHidden = false
        $0.progress = 0
        return $0
    }(UIProgressView(frame: CGRect(x: 20, y: screen.width-20, width: screen.width-40, height: 1)))
    
    
    lazy var albumImageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView(frame: CGRect(x: 20, y: 20, width: screen.width-40, height: screen.width-40)))
    
    
    lazy var artistNameLabel: UILabel = {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.font = UIFont(name: "Snell Roundhand", size: 30)
        $0.textColor = .black
        return $0
    }(UILabel(frame: CGRect(x: 20, y: 380, width: screen.width-40, height: 50)))
    
    
    lazy var albumNameLabel: UILabel = {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.font = UIFont(name: "Helvetica-Bold", size: 18)
        return $0
    }(UILabel(frame: CGRect(x: 20, y: 420, width: screen.width-40, height: 50)))
    
    
    lazy var songNameLabel: UILabel = {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.font = UIFont(name: "Helvetica", size: 16)
        return $0
    }(UILabel(frame: CGRect(x: 20, y: 460, width: screen.width-40, height: 50)))
    
    
    lazy var playPauseButton: UIButton = {
        $0.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        $0.tintColor = .black
        $0.center.x = holder.center.x
        return $0
    }(UIButton(frame: CGRect(x: .zero, y: 600, width: 70, height: 70), primaryAction: actionPlayPause))
    
    
    lazy var nextButton: UIButton = {
        $0.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        $0.tintColor = .black
        $0.center.x = holder.center.x+130
        return $0
    }(UIButton(frame: CGRect(x: .zero, y: 600, width: 70, height: 70), primaryAction: actionNext))
    
    
    lazy var backButton: UIButton = {
        $0.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        $0.tintColor = .black
        $0.center.x = holder.center.x-130
        return $0
    }(UIButton(frame: CGRect(x: .zero, y: 600, width: 70, height: 70), primaryAction: actionBack))
    
    
    lazy var slider: UISlider = {
        $0.value = 0.5
        return $0
    }(UISlider(frame: CGRect(x: 20, y: 700, width: screen.width-40, height: 50), primaryAction: actionSlider))
    
    
    lazy var actionSlider = UIAction {[weak self] _ in
        let value = self?.slider.value
        self?.player?.volume = value!
    }
    
    lazy var actionPlayPause = UIAction {[weak self] _ in
        if self?.player?.isPlaying == true {
            self?.player?.stop()
            self?.playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            self?.albumImageView.frame = CGRect(x: 30, y: 30, width: (self?.screen.width)!-60, height: (self?.screen.width)!-60)
        } else {
            self?.player?.play()
            self?.playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            self?.albumImageView.frame = CGRect(x: 10, y: 10, width: (self?.screen.width)!-20, height: (self?.screen.width)!-20)
        }
    }
    
    lazy var actionNext = UIAction {[weak self] _ in
        if self!.position < ((self?.songs.count)!-1) {
            self?.position += 1
            self?.player?.stop()
            for subview in self!.holder.subviews {
                subview.removeFromSuperview()
            }
            self!.visualConfigure()
            self!.dataConfigure()
        }
    }
    
    lazy var actionBack = UIAction {[weak self] _ in
        if self!.position > 0 {
            self?.position -= 1
            self?.player?.stop()
            for subview in self!.holder.subviews {
                subview.removeFromSuperview()
            }
            self!.visualConfigure()
            self!.dataConfigure()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(holder)
        visualConfigure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dataConfigure()
        
    }
    
    func dataConfigure() {
        let songs = songs[position]
        if songs.trackData == nil {
            guard let url = URL(string: songs.trackURL) else {fatalError("неверный url песни")}
            let session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
            let task = session.downloadTask(with: url).resume()
        } else {
            playerConfigure(data: songs.trackData!)
        }
    }
    
    func playerConfigure(data: Data) {
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            player = try? AVAudioPlayer(data: data)
            guard let player = player else {return}
            player.volume = 0.5
            player.play()
        } catch {return}
    }
    
    
    func visualConfigure() {
        let songs = songs[position]
        
        albumImageView.image = songs.imageUI
        if songs.trackData == nil {
            albumImageView.alpha = 0.3
        }
        
        artistNameLabel.text = songs.atristName
        albumNameLabel.text = songs.albumName
        songNameLabel.text = songs.name
        
        holder.addSubview(albumImageView)
        if songs.trackData == nil {
            albumImageView.alpha = 0.3
            indicator.startAnimating()
            indicator.isHidden = false
        }
        
        holder.addSubview(indicator)
        holder.addSubview(progressLabel)
        holder.addSubview(progressView)
        holder.addSubview(artistNameLabel)
        holder.addSubview(albumNameLabel)
        holder.addSubview(songNameLabel)
        holder.addSubview(playPauseButton)
        holder.addSubview(nextButton)
        holder.addSubview(backButton)
        holder.addSubview(slider)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
}

extension PlayerViewController: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        let data = try? Data(contentsOf: location)
        songs[position].trackData = data
        playerConfigure(data: data!)
        indicator.stopAnimating()
        progressLabel.isHidden = true
        progressView.isHidden = true
        indicator.isHidden = true
        albumImageView.alpha = 1
        albumImageView.frame = CGRect(x: 10, y: 10, width: screen.width-20, height: screen.width-20)
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        progressView.progress = progress
        progressLabel.text = "\(progress*100)%"
    }
}
