package vip.com.accommodation.service.reservation;

import org.springframework.ui.Model;
import vip.com.accommodation.dto.reservation.ReservationFindDto;
import vip.com.accommodation.dto.reservation.ReservationInsertDto;
import vip.com.accommodation.dto.reservation.ReservationListDto;
import vip.com.accommodation.dto.room.RoomInsertDto;

import java.util.List;

public interface ReservationService {


    public int maxNum();
    public void roomInsert(RoomInsertDto roomInsertDto);

    public int reservationSearch(ReservationFindDto reservationFindDto);
    public List<ReservationListDto> reservationMemberIdSearch(int memberId); //회원번호를 통한 예약번호 찾기

    public void reservationInsert(ReservationInsertDto reservationInsertDto);

    public void reservationDelete(int reservationId); //예약번호를 통한 예약취소(update식)
    public void reservationDeleteReservation(int reservationId); //예약번호를 통한 완전 예약삭제(delete)

    public List<ReservationFindDto> reservationFindDto(ReservationFindDto reservationFindDto);

    public List<ReservationListDto> myReservationList(int memberId);
}
