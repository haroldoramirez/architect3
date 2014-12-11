package br.edu.udc.sistemas.architect3.entity;

import br.edu.udc.sistemas.architect3.annotation.Column;
import br.edu.udc.sistemas.architect3.annotation.Entity;
import br.edu.udc.sistemas.architect3.annotation.GeneratedValue;
import br.edu.udc.sistemas.architect3.annotation.Id;
import br.edu.udc.sistemas.architect3.annotation.Table;

@Entity
@Table(name="pais")

public class Pais {
	
	@Id
	@GeneratedValue
	@Column(name = "idpais", type=Column.INTEGER, nullable=false, insertable=false, updatable=false, unique=true)
	private Integer idPais;
	
	@Column(name = "pais", type=Column.STRING, length=150, nullable=false)
	private String pais;
	
	@Column(name = "ddi", type=Column.INTEGER, nullable=false)
	private Integer ddi;

	public Integer getIdPais() {
		return idPais;
	}

	public void setIdPais(Integer idPais) {
		this.idPais = idPais;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public Integer getDdi() {
		return ddi;
	}

	public void setDdi(Integer ddi) {
		this.ddi = ddi;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Pais other = (Pais) obj;
		if (ddi == null) {
			if (other.ddi != null)
				return false;
		} else if (!ddi.equals(other.ddi))
			return false;
		if (idPais == null) {
			if (other.idPais != null)
				return false;
		} else if (!idPais.equals(other.idPais))
			return false;
		if (pais == null) {
			if (other.pais != null)
				return false;
		} else if (!pais.equals(other.pais))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Pais [idPais=" + this.idPais + ", pais=" + this.pais + ", ddi=" + this.ddi + "]";
	}
	
}
