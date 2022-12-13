#include "article.h"

Article::Article()
{

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

const QString &Article::getCreatedDate() const
{
    return createdDate;
}

void Article::setCreatedDate(const QString &newCreatedDate)
{
    createdDate = newCreatedDate;
}
