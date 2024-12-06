package com.road.perfectpro.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LawyerCareerDTO {
    private Long id;
    private String careerTitle;
    private String period;
}