#include "article.h"

Article::Article(QObject *parent):
    QObject(parent)
{

}

Article::Article(const Article &article):
    QObject(article.parent()),
    id(article.id),
    created(article.created),
    createdDate(article.createdDate),
    link(article.link),
    imagePreviewLink(article.imagePreviewLink),
    title(article.title),
    subtitle(article.subtitle),
    text(article.text),
    resource(article.resource)
{
    qDebug() << "copy Article";
}

int Article::getId() const
{
    return id;
}

void Article::setId(int newId)
{
    id = newId;
}

const QString &Article::getCreated() const
{
    return created;
}

void Article::setCreated(const QString &newCreated)
{
    created = newCreated;
}

const QString &Article::getCreatedDate() const
{
    return createdDate;
}

void Article::setCreatedDate(const QString &newCreatedDate)
{
    createdDate = newCreatedDate;
}

const QString &Article::getLink() const
{
    return link;
}

void Article::setLink(const QString &newLink)
{
    link = newLink;
}

const QString &Article::getImagePreviewLink() const
{
    return imagePreviewLink;
}

void Article::setImagePreviewLink(const QString &newImagePreviewLink)
{
    imagePreviewLink = newImagePreviewLink;
}

const QString &Article::getTitle() const
{
    return title;
}

void Article::setTitle(const QString &newTitle)
{
    title = newTitle;
}

const QString &Article::getSubtitle() const
{
    return subtitle;
}

void Article::setSubtitle(const QString &newSubtitle)
{
    subtitle = newSubtitle;
}

const QString &Article::getText() const
{
    return text;
}

void Article::setText(const QString &newText)
{
    text = newText;
}

const QString &Article::getResource() const
{
    return resource;
}

void Article::setResource(const QString &newResource)
{
    resource = newResource;
}

const QStringList &Article::getLabels() const
{
    return labels;
}

void Article::addLabel(const QString &newLabel)
{
    labels.append(newLabel);
}

bool Article::getIsImportant() const
{
    return isImportant;
}

void Article::setIsImportant(bool newIsImportant)
{
    isImportant = newIsImportant;
}
