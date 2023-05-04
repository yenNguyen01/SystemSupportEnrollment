/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.topic14.pojo;

import java.util.List;

/**
 *
 * @author Computer
 */
public class Pagination<Object> {
    private int pageNo;
    private int pageSize;
    private List<Object> items;

    public Pagination(int pageNo, int pageSize, List<Object> items) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.items = items;
    }

    public int getPageNo() {
        return pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public List<Object> getItems() {
        return items;
    }

    public int getTotalPages() {
        return (int) Math.ceil((double) items.size() / pageSize);
    }

    public boolean hasPreviousPage() {
        return pageNo > 1;
    }

    public boolean hasNextPage() {
        return pageNo < getTotalPages();
    }

    public Pagination<Object> getPreviousPage() {
        if (hasPreviousPage()) {
            return new Pagination<>(pageNo - 1, pageSize, items);
        }
        return null;
    }

    public Pagination<Object> getNextPage() {
        if (hasNextPage()) {
            return new Pagination<>(pageNo + 1, pageSize, items);
        }
        return null;
    }

    public List<Object> getPage() {
        if (pageNo >= 1 && pageNo <= getTotalPages()) {
            int fromIndex = (pageNo - 1) * pageSize;
            int toIndex = Math.min(fromIndex + pageSize, items.size());
            List<Object> pageItems = items.subList(fromIndex, toIndex);
            return pageItems;
        }
        return null;
    }
}
