package com.somsoms.tikitaka.domain;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name = "ALARM")
public class Alarm {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "alarm_seq")
    @SequenceGenerator(name = "alarm_seq", sequenceName = "ALARM_SEQ", allocationSize = 1)
    @Column(name = "ALARM_ID")
    private int alarmId;

    @ManyToOne
    @JoinColumn(name = "SENDER_ID", nullable = false)
    private User sender;

    @ManyToOne
    @JoinColumn(name = "RECEIVER_ID", nullable = false)
    private User receiver;

    @Column(name = "CONTENT")
    private String content;

    @Column(name = "IS_CHECKED", length = 1)
    private String isChecked = "N";

    @ManyToOne
    @JoinColumn(name = "MATCH_ID")
    private Matching matching;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATED_AT")
    private Date createdAt = new Date();

    public int getAlarmId() { return alarmId; }
    public void setAlarmId(int alarmId) { this.alarmId = alarmId; }

    public User getSender() { return sender; }
    public void setSender(User sender) { this.sender = sender; }

    public User getReceiver() { return receiver; }
    public void setReceiver(User receiver) { this.receiver = receiver; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getIsChecked() { return isChecked; }
    public void setIsChecked(String isChecked) { this.isChecked = isChecked; }

    public Matching getMatching() { return matching; }
    public void setMatching(Matching matching) { this.matching = matching; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

}