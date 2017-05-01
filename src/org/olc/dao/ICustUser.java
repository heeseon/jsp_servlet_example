package org.olc.dao;

import java.util.List;
import org.olc.dto.CustUserDto;

public interface ICustUser {
	List<CustUserDto> getCustLists();
	CustUserDto getCustUser(String id);
	boolean addCustUser(CustUserDto dto);
	boolean updateCustUser(CustUserDto dto);
	boolean deleteCustUser(String id);
	boolean muldelCustUser(String[] id);
}
