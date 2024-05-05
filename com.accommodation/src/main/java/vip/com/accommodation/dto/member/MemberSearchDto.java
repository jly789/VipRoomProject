package vip.com.accommodation.dto.member;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.*;
import java.time.LocalDate;

@Getter
@Setter
public class MemberSearchDto {


    private int memberId;


    @NotBlank(message = "필수 정보입니다.")
    private String userId;


    @NotBlank(message = "필수 정보입니다.")
    private String userName;


    @Pattern(regexp = "^(?:\\w+\\.?)*\\w+@(?:\\w+\\.)+\\w+$", message = "이메일 형식이 올바르지 않습니다.")
    private String email;



}
