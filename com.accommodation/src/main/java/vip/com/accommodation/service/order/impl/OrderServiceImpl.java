package vip.com.accommodation.service.order.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import vip.com.accommodation.dto.order.OrderInsertDto;
import vip.com.accommodation.mapper.order.OrderMapper;
import vip.com.accommodation.mapper.reservation.ReservationMapper;
import vip.com.accommodation.mapper.room.RoomMapper;
import vip.com.accommodation.service.order.OrderService;


@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private RoomMapper roomMapper;


    @Autowired
    private OrderMapper orderMapper;


    @Override
    public int maxNum() {
        return roomMapper.maxNum();
    }

    @Override
    public void orderInsert(OrderInsertDto orderInsertDto) {
        orderMapper.orderInsert(orderInsertDto);
    }

    @Override
    public void orderDelete(int reservationId) {
        orderMapper.orderDelete(reservationId);
    }


}
