package vip.com.accommodation.service.reservation;


import vip.com.accommodation.dto.reservation.ReservationFindDto;
import vip.com.accommodation.dto.reservation.ReservationInsertDto;
import vip.com.accommodation.dto.reservation.ReservationListDto;
import vip.com.accommodation.dto.room.RoomInsertDto;

import java.util.List;

public interface ReservationService {


    public int maxNum(); //가장높은 예약번호

    public void roomInsert(RoomInsertDto roomInsertDto); //객실등록

    public int reservationSearch(ReservationFindDto reservationFindDto); //예약찾기

    public List<ReservationListDto> reservationMemberIdSearch(int memberId); //회원번호를 통한 예약번호 찾기

    public void reservationInsert(ReservationInsertDto reservationInsertDto); //예약등록

    public void reservationDelete(int reservationId); //예약번호를 통한 예약취소(update식)

    public void reservationDeleteReservation(int reservationId); //예약번호를 통한 완전 예약삭제(delete)


    public List<ReservationFindDto> reservationFindDto(ReservationFindDto reservationFindDto); //예약찾기


    public List<ReservationListDto> myReservationList(int memberId); //나의 예약리스트

}
