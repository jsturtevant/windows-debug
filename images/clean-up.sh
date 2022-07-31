#!/bin/bash

image="${IMAGE:-debug-installer-cache}"


echo "deleting images '$image' that start with 'pr-'"
imageid=$(gh api \
    -H "Accept: application/vnd.github+json" \
    /users/jsturtevant/packages/container/${image}/versions \
    --jq '.[] | select(.metadata.container.tags | any(startswith("pr-"))) | .id')

for id in $imageid; do
    # check if image is older than 20hrs
    image_age=$(gh api \
        -H "Accept: application/vnd.github+json" \
        /users/jsturtevant/packages/container/${image}/versions/$id \
        --jq '.updated_at')
    
    tags=$(gh api \
        -H "Accept: application/vnd.github+json" \
        /users/jsturtevant/packages/container/${image}/versions/$id \
        --jq '.metadata.container.tags')

    if [[ $(date -d "$image_age" +%s) > $(date -d "24 hours ago" +%s) ]]; then
        echo "image $id with tag $tags isn't old enough, skipping"
        continue
    fi

    echo "deleting image $id with $tags"
    # https://github.com/cli/cli/issues/3937
    echo -n | gh api --method DELETE -H "Accept: application/vnd.github+json" \
        /users/jsturtevant/packages/container/${image}/versions/$id \
        --input -

    exit
done