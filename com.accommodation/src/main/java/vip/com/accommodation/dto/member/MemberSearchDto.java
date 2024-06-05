package vip.com.accommodation.dto.member;

import lombok.Getter;
import lombok.Setter;
import javax.validation.constraints.*;


@Getter
@Setter
public class MemberSearchDto {


    private int memberId; //회원번호


    @NotBlank(message = "필수 정보입니다.")
    private String userId; //사용자아이디


    @NotBlank(message = "필수 정보입니다.")
    private String userName; //사용자이름


    @Pattern(regexp = "^(?:\\w+\\.?)*\\w+@(?:\\w+\\.)+\\w+$", message = "이메일 형식이 올바르지 않습니다.")
    private String email; //이메일
 


}
