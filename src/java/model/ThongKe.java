package model;

public class ThongKe {

    private String label;
    private double total;

    public ThongKe() {
    }

    public ThongKe(String label, double total) {
        this.label = label;
        this.total = total;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}