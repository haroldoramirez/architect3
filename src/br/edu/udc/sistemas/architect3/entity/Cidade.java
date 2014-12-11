package br.edu.udc.sistemas.architect3.entity;

import br.edu.udc.sistemas.architect3.annotation.Column;
import br.edu.udc.sistemas.architect3.annotation.Entity;
import br.edu.udc.sistemas.architect3.annotation.GeneratedValue;
import br.edu.udc.sistemas.architect3.annotation.Id;
import br.edu.udc.sistemas.architect3.annotation.Table;

@Entity
@Table(name="cidade")

public class Cidade {
	
	@Id
	@GeneratedValue
	@Column(name = "idcidade", type = Column.INTEGER, nullable = false, insertable = false, updatable = false, unique = true)
	private Integer idCidade;
	
	@Column(name = "cidade", type = Column.STRING, length = 150, nullable = false)
	private String cidade;
	
	@Column(name = "ddd", type=Column.INTEGER, nullable=false)
	private Integer ddd;
	
	@Column(name = "estado", type = Column.OBJECT, nullable = false)
	private Estado estado;

	public Integer getIdCidade() {
		return idCidade;
	}

	public void setIdCidade(Integer idCidade) {
		this.idCidade = idCidade;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public Integer getDdd() {
		return ddd;
	}

	public void setDdd(Integer ddd) {
		this.ddd = ddd;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cidade other = (Cidade) obj;
		if (cidade == null) {
			if (other.cidade != null)
				return false;
		} else if (!cidade.equals(other.cidade))
			return false;
		if (ddd == null) {
			if (other.ddd != null)
				return false;
		} else if (!ddd.equals(other.ddd))
			return false;
		if (estado == null) {
			if (other.estado != null)
				return false;
		} else if (!estado.equals(other.estado))
			return false;
		if (idCidade == null) {
			if (other.idCidade != null)
				return false;
		} else if (!idCidade.equals(other.idCidade))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Cidade [idCidade=" + this.idCidade + ", cidade=" + this.cidade + ", ddd="
				+ this.ddd + ", estado=" + this.estado + "]";
	}
	
}
