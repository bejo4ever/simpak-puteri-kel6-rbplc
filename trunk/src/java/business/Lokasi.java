package business;

public class Lokasi {

    private String lantai;
    private String posisi;
    private String nmr_kendaraan;

    public Lokasi() {
        lantai = "";
        posisi = "";
        nmr_kendaraan = "";
    }

    public Lokasi(String lantai, String posisi, String nmr_kendaraan) {
        this.lantai = lantai;
        this.posisi = posisi;
        this.nmr_kendaraan = nmr_kendaraan;
    }

    /**
     * @return the lantai
     */
    public String getLantai() {
        return lantai;
    }

    /**
     * @param lantai the lantai to set
     */
    public void setLantai(String lantai) {
        this.lantai = lantai;
    }

    /**
     * @return the posisi
     */
    public String getPosisi() {
        return posisi;
    }

    /**
     * @param posisi the posisi to set
     */
    public void setPosisi(String posisi) {
        this.posisi = posisi;
    }

    /**
     * @return the nmr_kendaraan
     */
    public String getNmr_kendaraan() {
        return nmr_kendaraan;
    }

    /**
     * @param nmr_kendaraan the nmr_kendaraan to set
     */
    public void setNmr_kendaraan(String nmr_kendaraan) {
        this.nmr_kendaraan = nmr_kendaraan;
    }
}