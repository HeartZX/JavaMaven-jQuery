package com.hzx.maven.entity.po;

import com.hzx.maven.entity.Feedback;
import com.hzx.maven.entity.Reader;
import lombok.Data;

@Data
public class FeedbackPo extends Feedback {
    private Reader reader;
}
