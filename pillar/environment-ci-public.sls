elife:
    env: ci

journal_cms:
    {% set dummy_url = 'http://localhost:8080' %}
    api:
        articles_endpoint_for_migration: {{ dummy_url }}/articles/%s/versions
        articles_endpoint: {{ dummy_url }}/articles/%s/versions
        metrics_endpoint: {{ dummy_url }}/metrics/article/%s/%s
        all_articles_endpoint: {{ dummy_url }}/articles
