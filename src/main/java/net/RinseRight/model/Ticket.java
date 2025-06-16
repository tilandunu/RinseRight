package net.RinseRight.model;

public class Ticket {
    private int ticketID;
    private int uID;
    private String mode;
    private String inquiryType;
    private String subInquiryType;
    private String inquiry;
    private String suggestions;
    private String ticketStatus;
    private String response;

    public Ticket(int ticketID, int uID, String mode, String inquiryType, String subInquiryType, String inquiry, String suggestions, String ticketStatus, String response) {
        this.ticketID = ticketID;
        this.uID = uID;
        this.mode = mode;
        this.inquiryType = inquiryType;
        this.subInquiryType = subInquiryType;
        this.inquiry = inquiry;
        this.suggestions = suggestions;
        this.ticketStatus = ticketStatus;
        this.response = response;
    }

    public Ticket() {
		// TODO Auto-generated constructor stub
	}

	// Getters and setters
    public int getTicketID() {
        return ticketID;
    }

    public void setTicketID(int ticketID) {
        this.ticketID = ticketID;
    }

    public int getUID() {
        return uID;
    }

    public void setUID(int uID) {
        this.uID = uID;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getInquiryType() {
        return inquiryType;
    }

    public void setInquiryType(String inquiryType) {
        this.inquiryType = inquiryType;
    }

    public String getSubInquiryType() {
        return subInquiryType;
    }

    public void setSubInquiryType(String subInquiryType) {
        this.subInquiryType = subInquiryType;
    }

    public String getInquiry() {
        return inquiry;
    }

    public void setInquiry(String inquiry) {
        this.inquiry = inquiry;
    }

    public String getSuggestions() {
        return suggestions;
    }

    public void setSuggestions(String suggestions) {
        this.suggestions = suggestions;
    }

    public String getTicketStatus() {
        return ticketStatus;
    }

    public void setTicketStatus(String ticketStatus) {
        this.ticketStatus = ticketStatus;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }
}
