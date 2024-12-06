package com.road.perfectpro.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LawyerProfileDTO {
    private Long id;
    private String name;
    private String profileImage;
    private String subtitle1;
    private String subtitle2;
    private String greetingContent;
    private String signatureName;
    private String signatureImage;
    private List<LawyerCareerDTO> careers;
}