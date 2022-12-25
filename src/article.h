#ifndef ARTICLE_H
#define ARTICLE_H

#include <QDebug>
#include <QObject>
#include <QString>

class Article : public QObject
{
    Q_OBJECT
public:
    explicit Article(QObject *parent = nullptr);
    Article(const Article &);

    int getId() const;
    void setId(int newId);

    const QString &getCreated() const;
    void setCreated(const QString &newCreated);

    const QString &getCreatedDate() const;
    void setCreatedDate(const QString &newCreated_date);

    const QString &getLink() const;
    void setLink(const QString &newLink);

    const QString &getImagePreviewLink() const;
    void setImagePreviewLink(const QString &newImagePreviewLink);

    const QString &getTitle() const;
    void setTitle(const QString &newTitle);

    const QString &getSubtitle() const;
    void setSubtitle(const QString &newSubtitle);

    const QString &getText() const;
    void setText(const QString &newText);

    const QString &getResource() const;
    void setResource(const QString &newResource);

    const QStringList &getLabels() const;
    void addLabel(const QString &newLabel);

    bool getIsImportant() const;
    void setIsImportant(bool newIsImportant);

private:
    int id;
    QString created;
    QString createdDate;
    QString link;
    QString imagePreviewLink;
    QString title;
    QString subtitle;
    QString text;
    QString resource;
    QStringList labels;
    bool isImportant;
};

#endif // ARTICLE_H
