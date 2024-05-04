package vip.com.accommodation.dto.member;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

@Getter
@Setter
public class MemberInsertDto {


    private int memberId;

    @NotBlank(message = "필수 정보입니다.")
    @Pattern(regexp = "^[a-z0-9]{5,20}$", message = "5~20자리 영어 소문자와 숫자만 사용해 주세요.")
    private String userId;


    @NotBlank(message = "필수 정보입니다.")
    @Pattern(regexp = "(?=.*[a-z])(?=.*[0-9]).{4,20}", message = "4~20자리 영문 소문자와 숫자를 혼용하여 사용해 주세요.")
    private String pwd;

    @NotBlank(message = "필수 정보입니다.")
    private String userName;
}
