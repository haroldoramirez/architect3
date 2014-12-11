package br.edu.udc.sistemas.architect3.entity;

import br.edu.udc.sistemas.architect3.annotation.Column;
import br.edu.udc.sistemas.architect3.annotation.Entity;
import br.edu.udc.sistemas.architect3.annotation.GeneratedValue;
import br.edu.udc.sistemas.architect3.annotation.Id;
import br.edu.udc.sistemas.architect3.annotation.Table;

@Entity
@Table(name="unidadedemedida")

public class UnidadeDeMedida {
	
	@Id
	@GeneratedValue
	@Column(name = "idunidadedemedida", type=Column.INTEGER, nullable=false, insertable=false, updatable=false, unique=true)
	private Integer idUnidadeDeMedida;
	
	@Column(name = "medida", type=Column.STRING, length=45, nullable=false)
	private String medida;
	
	@Column(name = "descricao", type=Column.STRING, length=150, nullable=false)
	private String descricao;
	
	public Integer getIdUnidadeDeMedida() {
		return idUnidadeDeMedida;
	}

	public void setIdUnidadeDeMedida(Integer idUnidadeDeMedida) {
		this.idUnidadeDeMedida = idUnidadeDeMedida;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getMedida() {
		return medida;
	}

	public void setMedida(String medida) {
		this.medida = medida;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UnidadeDeMedida other = (UnidadeDeMedida) obj;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (idUnidadeDeMedida == null) {
			if (other.idUnidadeDeMedida != null)
				return false;
		} else if (!idUnidadeDeMedida.equals(other.idUnidadeDeMedida))
			return false;
		if (medida == null) {
			if (other.medida != null)
				return false;
		} else if (!medida.equals(other.medida))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UnidadeDeMedida [idUnidadeDeMedida=" + this.idUnidadeDeMedida
				+ ", descricao=" + this.descricao + ", medida=" + this.medida + "]";
	}

}
