package com.tonyng.epidemic.beans;

public class EpidemicDetailInfo extends EpidemicInfo {
    private String provinceName;
    private Integer affirmedTotal,suspectedTotal,isolatedTotal,curedTotal,deadTotal;

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public Integer getAffirmedTotal() {
        return affirmedTotal;
    }

    public void setAffirmedTotal(Integer affirmedTotal) {
        this.affirmedTotal = affirmedTotal;
    }

    public Integer getSuspectedTotal() {
        return suspectedTotal;
    }

    public void setSuspectedTotal(Integer suspectedTotal) {
        this.suspectedTotal = suspectedTotal;
    }

    public Integer getIsolatedTotal() {
        return isolatedTotal;
    }

    public void setIsolatedTotal(Integer isolatedTotal) {
        this.isolatedTotal = isolatedTotal;
    }

    public Integer getCuredTotal() {
        return curedTotal;
    }

    public void setCuredTotal(Integer curedTotal) {
        this.curedTotal = curedTotal;
    }

    public Integer getDeadTotal() {
        return deadTotal;
    }

    public void setDeadTotal(Integer deadTotal) {
        this.deadTotal = deadTotal;
    }
}
