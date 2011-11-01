class ChildrenController < ApplicationController
  #skip_before_filter :authorize

  # GET /children
  # GET /children.json
  def index
    @children = Child.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @children }
    end
  end

  # GET /children/1
  # GET /children/1.json
  def show
    @child = Child.find(params[:id])
    #used to determine layout used
    @child_crud = true

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @child }
    end
  end

  # GET /children/new
  # GET /children/new.json
  def new
    @child = Child.new
    @child_crud = true

    respond_to do |format|
      format.html # new.html.erb
      format.html {render}
      format.json { render json: @child }
    end
  end

  # GET /children/1/edit
  def edit
    @child = Child.find(params[:id])
    @child_crud = true
  end

  # POST /children
  # POST /children.json
  def create
    @child = Child.new(params[:child])
    @child_crud = true

    respond_to do |format|
      if @child.save
        format.html { redirect_to children_url, notice: 'Child was successfully created.' }
        format.js   { @current_child = @child}
        format.json { render json: @child, status: :created, location: @child }
      else
        format.html { render :layout => false, action: "new"}
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /children/1
  # PUT /children/1.json
  def update
    @child = Child.find(params[:id])

    respond_to do |format|
      if @child.update_attributes(params[:child])
        format.html { redirect_to children_url, notice: 'Child was successfully updated.' }
        format.js   { @current_child = @child}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /children/1
  # DELETE /children/1.json
  def destroy
    @child = Child.find(params[:id])
    @child.destroy

    respond_to do |format|
      format.html { redirect_to children_url }
      format.json { head :ok }
    end
  end


end
