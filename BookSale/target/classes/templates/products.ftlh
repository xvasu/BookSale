<#import "blocks/template.ftlh" as t>
<@t.template user>
    <#if user.isAdmin()>
        <hr>
        <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
           data-toggle="collapse" href="#collapseExample" role="button"
           aria-expanded="true" aria-controls="collapseExample">
            Добавить новый товар
        </a>
        <div class="collapse mb-3" id="collapseExample" style="">
            <form action="/product/create" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="productName">Название товара</label>
                    <input type="text" required class="form-control"
                           id="productName" name="title">
                </div>
                <div class="form-group">
                    <label for="price">Цена товара</label>
                    <div class="input-group mb-3">
                        <input type="number" required class="form-control" id="price" name="price">
                        <div class="input-group-append">
                            <span class="input-group-text">руб.</span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="searchSection">Раздел</label>
                    <select id="searchSection" required name="section" class="form-control">
                        <option value="">Раздел не выбран</option>
                        <option value="Сказки">Сказки</option>
                        <option value="Стихи для  детей">Стихи для  детей</option>
                        <option value="Приключения">Приключения</option>
                        <option value="Фантастика и фэнтези">Фантастика и фэнтези</option>
                        <option value="Комиксы и графические романы">Комиксы и графические романы</option>
                        <option value="Повести и рассказы">Повести и рассказы</option>
                        <option value="Внеклассное чтение">Внеклассное чтение</option>
                        <option value="Учебные материалы">Учебные материалы</option>

                    </select>
                </div>

                <div class="form-group">
                    <label for="description">Описание товара</label>
                    <textarea required class="form-control" id="description" name="description"></textarea>
                </div>
                <div class="form-group">
                    <label for="author">Автор</label>
                    <input type="text" required class="form-control"
                           id="author" name="author">
                </div>
                <div class="form-group">
                    <label for="publishingHouse">Издательство</label>
                    <input type="text" required class="form-control"
                           id="publishingHouse" name="publishingHouse">
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input required type="file" name="file1" id="file1">
                        <label class="custom-file-label" for="file1">Первая фотография к товару</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file2" id="file2">
                        <label class="custom-file-label" for="file2">Вторая фотография к товару</label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file3" id="file3">
                        <label class="custom-file-label" for="file3">Третья фотография к товару</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                <button type="submit" style="width: 100%" class="btn btn-dark">Добавить</button>
            </form>
        </div>
    </#if>
<h1 style="text-align: center">Поиск товаров</h1><hr>
<form method="get" action="/">
    <div class="form-row">
        <div class="form-group col-md-3">
            <label for="searchSection">Раздел</label>
            <select id="searchSection" name= "searchSection" class="form-control" onchange=>
                <option value="">Раздел не выбран</option>
                <option value="Сказки">Сказки</option>
                <option value="Стихи для  детей">Стихи для  детей</option>
                <option value="Приключения">Приключения</option>
                <option value="Фантастика и фэнтези">Фантастика и фэнтези</option>
                <option value="Комиксы и графические романы">Комиксы и графические романы</option>
                <option value="Повести и рассказы">Повести и рассказы</option>
                <option value="Внеклассное чтение">Внеклассное чтение</option>
                <option value="Учебные материалы">Учебные материалы</option>
            </select>
        </div>
        <div class="form-group col-md-9">
            <label for="searchWord">Поиск по объявлениям</label>
            <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                   id="searchWord">
        </div>
        <button style="width: 100%" type="submit" class="btn btn-dark">Поиск</button>
    </div>
</form>
<hr>
    <div class="card-columns">
        <#list products as product>
<#--            <a href="/product/${product.id}" class="product-link">-->
                <div class="card text-white bg-dark my-3 product">
                    <#if user.isAdmin()>
                        <div class="card-top">
                            <form action="/product/delete/${product.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-danger m-3">
                                    Удалить
                                </button>
                            </form>
                        </div>
                    </#if>
                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.price} руб.</p>
                    </div>
                    <div class="card-footer">
                        ${product.section}
                    </div>
                </div>
            </a>
<#--        <#else>-->
<#--            <h1 style="text-align: center">Не найдено</h1>-->
        </#list>
    </div>
    <script>

    </script>
</@t.template>