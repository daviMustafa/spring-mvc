<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="${produto.titulo}">

	<article id="${produto.id}">
		<header id="product-highlight" class="clearfix">
		
			<div id="product-overview" class="container">
				<img width="280px" height="395px"
					src="http://cdn.shopify.com/s/files/1/0155/7645/products/css-eficiente-featured_large.png?v=1435245145"
					class="product-featured-image" />
					
				<h1 class="product-title">${produto.titulo}</h1>
				
				<p class="book-description">${produto.descricao}</p>
			</div>
			
		</header>


		<section class="buy-options clearfix">
			
			<form:form servletRelativeAction="/carrinho/add" method="post" cssClass="container">
				<ul id="variants" class="clearfix">
					
					<input type="hidden" value="${produto.id}" name="produtoId"/>
					
					<c:forEach items="#{produto.precos}" var="preco">
						<li class="buy-option">
							<input type="radio" id="tipoPreco" name="tipoPreco" class="variant-radio" 
								value="${preco.tipo}" checked="checked" /> 
							<label itemprop="category" class="variant-label">${preco.tipo}</label>
							 
							<small class="compare-at-price">R$ 39,90</small>
							<p class="variant-price">${preco.valor}</p>
						</li>
					</c:forEach>
				</ul>

				<button type="submit" class="submit-image icon-basket-alt" alt="Compre Agora" title="Compre Agora '${produto.titulo}"></button>
			</form:form>
		</section>

		<div class="container">
			<section class="summary">
				<ul>
					<li>
						<h3>
							E muito mais... <a href='/pages/sumario-java8'>veja o sumário</a>.
						</h3>
					</li>
				</ul>
			</section>

			<section class="data product-detail">
				<h2 class="section-title">Dados do livro:</h2>
				<p>
					Número de páginas: <span>${produto.paginas}</span>
				</p>
				<p></p>
				<p>Data de publicação: <span class="publishedAt">
					<fmt:formatDate pattern="dd/MM/yyyy" value="${produto.dataLancamento.time}"/>
				</span></p>
				<p>
					Encontrou um erro? <a href='/submissao-errata' target='_blank'>Submeta uma errata</a>
				</p>
			</section>
		</div>
	</article>
</tags:pageTemplate>