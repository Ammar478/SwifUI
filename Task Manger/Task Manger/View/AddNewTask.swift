//
//  AddNewTask.swift
//  Task Manger
//
//  Created by Ammar Ahmed on 14/06/1445 AH.
//

import SwiftUI

struct AddNewTask: View {
    @EnvironmentObject var taskModel:TaskViewModel
    @Environment(\.self) var env
    @Namespace var Animation
    
    var body: some View {
        VStack(spacing: 12){
            Text("Edit Task")
                .font(.title3.bold())
                .frame(maxWidth:.infinity)
                .overlay(alignment:.leading){
                    Button{
                        env.dismiss()
                    }label: {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundStyle(.black)
                    }
                }
            VStack(alignment:.leading,spacing: 8){
                Text("Task colors")
                    .font(.callout)
                    .foregroundStyle(.gray)
                
                HStack(spacing:15){
                    let colors:[String] = ["Yellow","Red","Orange","Green","Purple","Blue"]
                    
                    ForEach(colors,id:\.self){
                        color in
                        Circle()
                            .fill(Color(color))
                            .frame(width:24,height: 24)
                            .background{
                                
                                if taskModel.taskColor == color {
                                    
                                    Circle()
                                        .strokeBorder(.gray)
                                        .padding(-3)
                                }
                            }
                            .contentShape(Circle())
                            .onTapGesture {
                                withAnimation{
                                    taskModel.taskColor = color
                                }
                            }
                        
                        
                    }
                }
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            .padding(.top,9)
            
            Divider()
                .padding(.vertical,9)
            
            VStack(alignment:.leading,spacing: 8){
                Text("Task DeadLine")
                    .font(.callout)
                    .foregroundStyle(.gray)
                Text(taskModel.taskDeadLin.formatted(date:.abbreviated ,time: .omitted) + " , " + taskModel.taskDeadLin.formatted(date:.omitted,time: .shortened))
                    .frame(maxWidth:.infinity,alignment:.leading)
                    .padding(.top,8)
            }
            .frame(maxWidth:.infinity, alignment:.leading)
            .overlay(alignment:.bottomTrailing){
                
                Button{
                    
                } label: {
                    Image(systemName: "calendar")
                        .foregroundStyle(.black)
                }
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            
            Divider()
                .padding(.vertical,9)
            
            VStack(alignment:.leading,spacing: 8){
                Text("Task Title")
                    .font(.callout)
                    .foregroundStyle(.gray)
                TextField("" ,text: ($taskModel.taskTitle))
                    .font(.callout)
                    .foregroundStyle(.black)
                    .background(.gray.opacity(0.1))
                
            }
            
            Divider()
                .padding(.vertical,9)
            
            VStack(alignment:.leading,spacing: 8){
                let Typs:[String] = ["Basic" , "Urgent", "Importent"]
                
                Text("Task Type")
                    .font(.callout)
                    .foregroundStyle(.gray)
                HStack{
                    ForEach(Typs,id:\.self){type in
                        Text(type)
                            .font(.callout)
                            .padding(.vertical,8)
                            .foregroundStyle(taskModel.taskType == type ? .white : .black)
                            .frame(maxWidth:.infinity)
                            .background{
                                if taskModel.taskType == type {
                                    Capsule()
                                        .fill(.black)
                                        .matchedGeometryEffect(id: "TYPE", in: Animation)
                                }else{
                                    Capsule()
                                        .strokeBorder(.black)
                                }
                            }
                            .contentShape(Capsule())
                            .onTapGesture {
                                withAnimation{
                                    taskModel.taskType = type
                                }
                            }
                    }
                }
                
            }
            
            Divider()
                .padding(.vertical,9)
            
            Button{
                
            }label: {
                Text("Save").font(.callout)
                    .foregroundStyle(.white).padding(.vertical,9)
                    .frame(maxWidth:.infinity)
                    .background{Capsule()
                        .fill(.black)}
            }
            .frame(maxHeight:.infinity, alignment:.bottom)
            .padding(.bottom,10)
            .disabled(taskModel.taskTitle == "")
            .opacity(0.6)
        }
        .frame(maxHeight: .infinity,alignment: .top)
        .padding()
    }
}

#Preview {
    AddNewTask().environmentObject(TaskViewModel())
}
