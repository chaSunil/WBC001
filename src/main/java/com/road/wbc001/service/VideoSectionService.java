package com.road.wbc001.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.road.wbc001.repository.VideoSectionRepository;
import com.road.wbc001.vo.Video;
import com.road.wbc001.vo.VideoSection;

import java.util.ArrayList;
import java.util.Arrays;

@Service
@Transactional(readOnly = true)
@RequiredArgsConstructor
public class VideoSectionService {
    
    private final VideoSectionRepository videoSectionRepository;
    private static final int MAX_VIDEOS = 3;
    
    public VideoSection getVideoSection() {
        VideoSection videoSection = videoSectionRepository.findFirstByOrderByIdAsc();
        if (videoSection == null) {  // isEmpty 체크 제거
            return createDefaultVideoSection();
        }
        return videoSection;
    }
    
    @Transactional
    public void save(VideoSection videoSection) {
        // 1. 기존 섹션 조회
        VideoSection existingSection = videoSectionRepository.findById(videoSection.getId())
                .orElseGet(() -> createDefaultVideoSection());
        
        // 2. 기본 정보 업데이트
        existingSection.setMainTitle(videoSection.getMainTitle());
        
        // 3. 비디오 목록 업데이트
        if (videoSection.getVideos() != null && !videoSection.getVideos().isEmpty()) {
            // 기존 비디오 연결 해제
            existingSection.getVideos().forEach(video -> video.setVideoSection(null));
            existingSection.getVideos().clear();
            
            // 새 비디오 설정
            videoSection.getVideos().forEach(video -> {
                video.setVideoSection(existingSection);
                existingSection.getVideos().add(video);
            });
        }
        
        // 4. 저장
        videoSectionRepository.save(existingSection);
    }
    
    private String extractVideoId(String url) {
        String pattern = "(?<=watch\\?v=|/videos/|embed\\/|youtu.be\\/|\\/v\\/|\\/e\\/|watch\\?v%3D|watch\\?feature=player_embedded&v=|%2Fvideos%2F|embed%\u200C\u200B2F|youtu.be%2F|%2Fv%2F)[^#\\&\\?\\n]*";
        
        java.util.regex.Pattern compiledPattern = java.util.regex.Pattern.compile(pattern);
        java.util.regex.Matcher matcher = compiledPattern.matcher(url);
        
        if (matcher.find()) {
            return matcher.group();
        }
        return url;
    }
    
    @Transactional
    public VideoSection createDefaultVideoSection() {
        VideoSection videoSection = new VideoSection();
        videoSection.setMainTitle("대표 영상");
        
        Video video1 = new Video();
        video1.setNumber(1);
        video1.setVideoId("dqv9xBRx0Vc");
        video1.setTitle("민사소송 진행 절차 안내");
        video1.setDescription("많은 분들이 어려워하시는 민사소송의 진행 절차를 안내해드립니다.");
        video1.setVideoSection(videoSection);
        
        Video video2 = new Video();
        video2.setNumber(2);
        video2.setVideoId("A1nSgoamcJQ");
        video2.setTitle("해결 사례");
        video2.setDescription("실제 해결된 사례를 소개합니다.");
        video2.setVideoSection(videoSection);
        
        Video video3 = new Video();
        video3.setNumber(3);
        video3.setVideoId("ntkZPFJRPC4");
        video3.setTitle("채권추심 성공 노하우");
        video3.setDescription("효과적인 채권추심을 위한 법적 절차와 노하우를 공유합니다.");
        video3.setVideoSection(videoSection);
        
        videoSection.setVideos(new ArrayList<>(Arrays.asList(video1, video2, video3)));
        
        return videoSectionRepository.save(videoSection);
    }
    
    @Transactional
    public void resetToDefault() {
        videoSectionRepository.deleteAll();
        createDefaultVideoSection();
    }
} 