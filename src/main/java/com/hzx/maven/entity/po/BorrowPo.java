package com.hzx.maven.entity.po;

import com.hzx.maven.entity.Book;
import com.hzx.maven.entity.Borrow;
import lombok.Data;

@Data
public class BorrowPo extends Borrow {
    private Integer borrowNum;

    private Book book;
}
