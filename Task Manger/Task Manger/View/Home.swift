//
//  Home.swift
//  Task Manger
//
//  Created by Ammar Ahmed on 14/06/1445 AH.
//

import SwiftUI

struct Home: View {
    
    @StateObject var TaskModel: TaskViewModel = .init()
    @Namespace
    var animated
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .leading){
                VStack(alignment: .leading, spacing: 8.0){
                    Text("Welcome back").font(.callout)
                    Text("Here is Updated Date").font(.title2.bold())
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                CustomSegmentBar()
                    .padding(.top,5)
            }
            .padding()
        }
        .overlay(alignment:.bottom){
            Button{
                TaskModel.openEditTask.toggle()
            }label: {
                Label{
                    Text("Add Task")
                        .font(.callout)
                        .fontWeight(.semibold)
                } icon: {
                    Image(systemName: "plus.app.fill")
                }
                .foregroundStyle(.white)
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(.black ,in:Capsule())
                
            }
            .padding()
            
        }
        .fullScreenCover(isPresented: $TaskModel.openEditTask){
            AddNewTask().environmentObject(TaskModel)
        }
        
    }
    
    @ViewBuilder
    func CustomSegmentBar()->some View {
        let tabs = ["Today","Upcoming","Task Done"]
        HStack(spacing: 10){
            ForEach(tabs,id:\.self){ tab in
                Text(tab)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .scaleEffect(0.9)
                    .foregroundStyle(TaskModel.currentTab == tab ? .white :.black)
                    .frame(maxWidth:.infinity)
                    .padding(.vertical,6)
                    .background{
                        if TaskModel.currentTab == tab {
                            Capsule()
                                .fill(.black)
                                .matchedGeometryEffect(id: "TAB", in: animated)
                        }
                    }
                    .contentShape(Capsule())
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)){
                            TaskModel.currentTab = tab
                        }
                    
                    }
                    .padding(.top,5)
                    .frame(maxWidth:.infinity)
                    .background(
                        LinearGradient(colors:[
                            .white.opacity(0.04),
                            .white.opacity(0.4),
                            .white.opacity(0.7),
                            .white
                        ],startPoint: .top ,endPoint: .bottom)
                        .ignoresSafeArea()
                    )
                
            }
        }
    }
}

#Preview {
    Home()
}
