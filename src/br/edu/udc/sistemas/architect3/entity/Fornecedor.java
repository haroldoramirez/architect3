package br.edu.udc.sistemas.architect3.entity;

import br.edu.udc.sistemas.architect3.annotation.Column;
import br.edu.udc.sistemas.architect3.annotation.Entity;
import br.edu.udc.sistemas.architect3.annotation.GeneratedValue;
import br.edu.udc.sistemas.architect3.annotation.Id;
import br.edu.udc.sistemas.architect3.annotation.Table;

@Entity
@Table(name="fornecedor")

public class Fornecedor {
	
	@Id
	@GeneratedValue
	@Column(name = "idfornecedor", type = Column.INTEGER, nullable = false, insertable = false, updatable = false, unique = true)
	private Integer idFornecedor;
	
	@Column(name = "cnpj", type = Column.STRING, length = 22, nullable = false)
	private String cnpj;
	
	@Column(name = "inscricaoestadual", type = Column.STRING, length = 18, nullable = false)
	private String inscricaoEstadual;
	
	@Column(name = "razaosocial", type = Column.STRING, length = 150, nullable = false)
	private String razaoSocial;
	
	@Column(name = "nomefantasia", type = Column.STRING, length = 150, nullable = false)
	private String nomeFantasia;
	
	@Column(name = "telefone", type = Column.STRING, length = 15, nullable = false)
	private String telefone;
	
	@Column(name = "celular", type = Column.STRING, length = 15, nullable = false)
	private String celular;
	
	@Column(name = "fax", type = Column.STRING, length = 15, nullable = false)
	private String fax;
	
	@Column(name = "email", type = Column.STRING, length = 100, nullable = false)
	private String email;
	
	@Column(name = "site", type = Column.STRING, length = 100, nullable = false)
	private String site;
	
	@Column(name = "endereco", type = Column.STRING, length = 150, nullable = false)
	private String endereco;
	
	@Column(name = "numero", type = Column.STRING, length = 10, nullable = false)
	private String numero;
	
	@Column(name = "bairro", type = Column.STRING, length = 45, nullable = false)
	private String bairro;
	
	@Column(name = "cep", type = Column.STRING, length = 45, nullable = false)
	private String cep;
	
	@Column(name = "pais", type = Column.OBJECT, nullable = false)
	private Pais pais;
	
	@Column(name = "estado", type = Column.OBJECT, nullable = false)
	private Estado estado;
	
	@Column(name = "cidade", type = Column.OBJECT, nullable = false)
	private Cidade cidade;
	
	@Column(name = "observacoes", type = Column.STRING, length = 400, nullable = false)
	private String observacoes;

	public Integer getIdFornecedor() {
		return idFornecedor;
	}

	public void setIdFornecedor(Integer idFornecedor) {
		this.idFornecedor = idFornecedor;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getInscricaoEstadual() {
		return inscricaoEstadual;
	}

	public void setInscricaoEstadual(String inscricaoEstadual) {
		this.inscricaoEstadual = inscricaoEstadual;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public String getNomeFantasia() {
		return nomeFantasia;
	}

	public void setNomeFantasia(String nomeFantasia) {
		this.nomeFantasia = nomeFantasia;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public Pais getPais() {
		return pais;
	}

	public void setPais(Pais pais) {
		this.pais = pais;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}

	public String getObservacoes() {
		return observacoes;
	}

	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Fornecedor other = (Fornecedor) obj;
		if (bairro == null) {
			if (other.bairro != null)
				return false;
		} else if (!bairro.equals(other.bairro))
			return false;
		if (celular == null) {
			if (other.celular != null)
				return false;
		} else if (!celular.equals(other.celular))
			return false;
		if (cep == null) {
			if (other.cep != null)
				return false;
		} else if (!cep.equals(other.cep))
			return false;
		if (cidade == null) {
			if (other.cidade != null)
				return false;
		} else if (!cidade.equals(other.cidade))
			return false;
		if (cnpj == null) {
			if (other.cnpj != null)
				return false;
		} else if (!cnpj.equals(other.cnpj))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (endereco == null) {
			if (other.endereco != null)
				return false;
		} else if (!endereco.equals(other.endereco))
			return false;
		if (estado == null) {
			if (other.estado != null)
				return false;
		} else if (!estado.equals(other.estado))
			return false;
		if (fax == null) {
			if (other.fax != null)
				return false;
		} else if (!fax.equals(other.fax))
			return false;
		if (idFornecedor == null) {
			if (other.idFornecedor != null)
				return false;
		} else if (!idFornecedor.equals(other.idFornecedor))
			return false;
		if (inscricaoEstadual == null) {
			if (other.inscricaoEstadual != null)
				return false;
		} else if (!inscricaoEstadual.equals(other.inscricaoEstadual))
			return false;
		if (nomeFantasia == null) {
			if (other.nomeFantasia != null)
				return false;
		} else if (!nomeFantasia.equals(other.nomeFantasia))
			return false;
		if (numero == null) {
			if (other.numero != null)
				return false;
		} else if (!numero.equals(other.numero))
			return false;
		if (observacoes == null) {
			if (other.observacoes != null)
				return false;
		} else if (!observacoes.equals(other.observacoes))
			return false;
		if (pais == null) {
			if (other.pais != null)
				return false;
		} else if (!pais.equals(other.pais))
			return false;
		if (razaoSocial == null) {
			if (other.razaoSocial != null)
				return false;
		} else if (!razaoSocial.equals(other.razaoSocial))
			return false;
		if (site == null) {
			if (other.site != null)
				return false;
		} else if (!site.equals(other.site))
			return false;
		if (telefone == null) {
			if (other.telefone != null)
				return false;
		} else if (!telefone.equals(other.telefone))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Fornecedor [idFornecedor=" + this.idFornecedor + ", cnpj=" + this.cnpj
				+ ", inscricaoEstadual=" + this.inscricaoEstadual + ", razaoSocial="
				+ this.razaoSocial + ", nomeFantasia=" + this.nomeFantasia
				+ ", telefone=" + this.telefone + ", celular=" + this.celular + ", fax="
				+ this.fax + ", email=" + this.email + ", site=" + this.site + ", endereco="
				+ this.endereco + ", numero=" + this.numero + ", bairro=" + this.bairro
				+ ", cep=" + this.cep + ", pais=" + this.pais + ", estado=" + this.estado
				+ ", cidade=" + this.cidade + ", obsevacoes=" + this.observacoes + "]";
	}
	
}
